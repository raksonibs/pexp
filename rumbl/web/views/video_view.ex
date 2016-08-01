defmodule Rumbl.VideoView do
  use Rumbl.Web, :view

  def find_category(category) do
    if category != nil do
      Rumbl.Repo.get(Rumbl.Category, category).name
    else
    end
  end
end
