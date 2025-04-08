defmodule Testelixir.Account do
  alias Testelixir.User
  alias Testelixir.Repo

  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(user) do
    Repo.delete(user)
  end

  def get_user(id) do
    Repo.get(User, id)
  end

  def list_users do
    Repo.all(User)
  end

  def get_user_by_name(name) do
    Repo.get_by(User, name: name)
  end

  def get_user_by_email(email) do
    Repo.get_by(User, email: email)
  end

  def get_user_by_id(id) do
    Repo.get(User, id)
  end
end
