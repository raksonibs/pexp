defmodule Rumbl.Auth do 
  import Plug.Conn

  def init(opts) do 
    # In the init function, we take the given options, extracting the repository. Keyword.fetch! raises an exception if the given key doesn’t exist, so Rumbl.Auth always requires the :repo option.
    Keyword.fetch!(opts, :repo)
  end

  def call(conn, repo) do 
    # call receives the repository from init and then checks if a :user_id is stored in the session. If one exists, we look it up and assign the result in the connection. assign is a function imported from Plug.Conn that slightly transforms the connec- tion—in this case, storing the user (or nil) in conn.assigns. That way, the :cur- rent_user will be available in all downstream functions including controllers and views.
    user_id = get_session(conn, :user_id)
    user = user_id && repo.get(Rumbl.User, user_id)
    assign(conn, :current_user, user)
  end

  def login(conn, user) do 
    conn 
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end
end