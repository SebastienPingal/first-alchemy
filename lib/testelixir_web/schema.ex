defmodule TestelixirWeb.Schema do
  use Absinthe.Schema

  import_types(TestelixirWeb.Schema.Types.UserType)

  query do
    @desc "Get all users"
    field :users, list_of(:user) do
      resolve(fn _, _, _ ->
        {:ok, Testelixir.Account.listUsers()}
      end)
    end

    @desc "Get a user by id"
    field :user, :user do
      arg(:id, :id)

      resolve(fn _, %{id: id}, _ ->
        case Testelixir.Account.getUserById(id) do
          nil -> {:error, "User not found"}
          user -> {:ok, user}
        end
      end)
    end
  end

  mutation do
    @desc "Create a user"
    field :create_user, :user do
      arg(:name, :string)
      arg(:email, :string)

      resolve(fn _, args, _ ->
        case Testelixir.Account.createUser(args) do
          {:ok, user} -> {:ok, user}
          {:error, changeset} -> {:error, changeset}
        end
      end)
    end

    @desc "Update a user"
    field :update_user, :user do
      arg(:id, :id)
      arg(:name, :string)
      arg(:email, :string)

      resolve(fn _, args, _ ->
        case Testelixir.Account.getUserById(args.id) do
          nil -> {:error, "User not found"}
          user ->
            case Testelixir.Account.updateUser(user, args) do
              {:ok, user} -> {:ok, user}
              {:error, changeset} -> {:error, changeset}
            end
        end
      end)
    end

    @desc "Delete a user"
    field :delete_user, :user do
      arg(:id, :id)

      resolve(fn _, args, _ ->
        case Testelixir.Account.getUserById(args.id) do
          nil -> {:error, "User not found"}
          user ->
            case Testelixir.Account.deleteUser(user) do
              {:ok, user} -> {:ok, user}
              {:error, changeset} -> {:error, changeset}
            end
        end
      end)
    end
  end
end
