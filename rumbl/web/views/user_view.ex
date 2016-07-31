defmodule Rumbl.UserView do
  use Rumbl.Web, :view
  alias Rumbl.User

  def first_name(%User{name: name}) do 
    name
    |> String.split(" ")
    |> Enum.at(0)
    # enum.at index at the split value
  end

end
