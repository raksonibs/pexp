defmodule Rumbl.User do
  # defstruct [:id, :name, :username, :password]

  use Rumbl.Web, :model

  schema "users" do 
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps
  end

  def changeset(model, params \\ %{}) do 
    # name and username are requred, with no optinal fields (cast checks for this)
    # we pipe cast, which returns an Ecto.Changeset, into a validate_length propery
    model
    |> cast(params, ~w(name username))
    |> validate_length(:username, min: 1, max: 20)
  end

  # virtual field is an intermediate field before hasing password into hash. not peresisted.
end