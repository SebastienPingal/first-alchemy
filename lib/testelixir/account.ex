defmodule Testelixir.Account do
  alias Testelixir.User
  alias Testelixir.Repo

  def createUser(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def updateUser(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def deleteUser(user) do
    Repo.delete(user)
  end

  def getUser(id) do
    Repo.get(User, id)
  end

  def listUsers do
    Repo.all(User)
  end

  def getUserByName(name) do
    Repo.get_by(User, name: name)
  end

  def getUserByEmail(email) do
    Repo.get_by(User, email: email)
  end

  def getUserById(id) do
    Repo.get(User, id)
  end
end
