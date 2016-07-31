- temp password update
for u <- Rumbl.Repo.all(User) do
  Rumbl.Repo.update!(User.registration_changeset(u, %{
    password: u.password_hash || "temppass"
  }))
end