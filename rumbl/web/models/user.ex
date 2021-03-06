defmodule Rumbl.User do
  # defstruct [:id, :name, :username, :password]

  use Rumbl.Web, :model

  schema "users" do 
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many :videos, Rumbl.Video
    has_many :annotations, Rumbl.Annotation
    
    timestamps
  end

  def changeset(model, params \\ %{}) do 
    # name and username are requred, with no optinal fields (cast checks for this)
    # we pipe cast, which returns an Ecto.Changeset, into a validate_length propery
    model
    |> cast(params, ~w(name username))
    |> validate_length(:username, min: 1, max: 20)
    |> unique_constraint(:username)
  end

  # put pass hash calls prviate function to has password an add to result
  def registration_changeset(model, params) do 
    model 
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 1, max: 100)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do 
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} -> 
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ -> 
        changeset
    end

  end

  def user_count() do 
    from u in Rumbl.User, select: count(u.id)
  end

  def specific_count() do 
    from u in user_count, where: ilike(u.username, ^"%j")
  end

  # virtual field is an intermediate field before hasing password into hash. not peresisted.
end