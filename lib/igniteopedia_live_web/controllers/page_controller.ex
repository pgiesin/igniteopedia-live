defmodule IgniteopediaLiveWeb.PageController do
  use IgniteopediaLiveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
