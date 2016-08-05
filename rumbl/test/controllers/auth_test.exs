defmodule Rumble.AuthTest do 
  use Rumbl.ConnCase
  alias Rumbl.Auth

  setup %{conn: conn} do 
    conn = conn 
      |> conn 
      |> bypass_through(Rumbl.Router, :browser)
      |> get("/")

    {:ok, %{conn: conn}}
  end

  test "login puts the user in the session", %{conn: conn} do login_conn =
    login_conn = conn
      |> Auth.login(%Rumbl.User{id: 123}) 
      |> send_resp(:ok, "")
    next_conn = get(login_conn, "/")
    assert get_session(next_conn, :user_id) == 123 
  end

  test "logput", %{conn: conn} do login_conn =
    logout_conn = conn
      |> put_session(:user_id, 123) 
      |> Auth.logout()
      |> send_resp(:ok, "")
    next_conn = get(logout_conn, "/")
    assert get_session(next_conn, :user_id) == 123 
  end

  test "call places user from session into assigns", %{conn: conn} do
    user = insert_user()
    conn =
  end

  test "authenticate_user halts when no user", %{conn: conn} do 
    conn = Auth.authenticate_user([])
    assert conn.halthed
  end

  test "authenticate_user contin when user", %{conn: conn} do 
    conn = conn 
      |> assign(:current_user, %Rumbl.User{})
      |> Auth.authenticate_user([])

    refute conn.halted 
  end
end