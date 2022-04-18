defmodule IgniteopediaLiveWeb.UserRegistrationController do
  use IgniteopediaLiveWeb, :controller

  alias AccountManager 
  alias RepoManager.Impl.User
  alias IgniteopediaLiveWeb.UserAuth

  def new(conn, _params) do
    changeset = AccountManager.change_user_registration(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case AccountManager.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          AccountManager.deliver_user_confirmation_instructions(
            user,
            &Routes.user_confirmation_url(conn, :edit, &1)
          )

        conn
        |> put_flash(:info, "User created successfully.")
        |> UserAuth.log_in_user(user)

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
