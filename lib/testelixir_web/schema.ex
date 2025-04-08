defmodule TestelixirWeb.Schema do
  use Absinthe.Schema

  import_types(TestelixirWeb.Schema.Types.UserType)
  import_types(TestelixirWeb.Schema.Types.MessageType)

  query do
    @desc "Get all users"
    field :users, list_of(:user) do
      resolve(fn _, _, _ ->
        {:ok, Testelixir.Account.list_users()}
      end)
    end

    @desc "Get a user by id"
    field :user, :user do
      arg(:id, :id)

      resolve(fn _, %{id: id}, _ ->
        case Testelixir.Account.get_user_by_id(id) do
          nil -> {:error, "User not found"}
          user -> {:ok, user}
        end
      end)
    end

    @desc "Get all messages"
    field :messages, list_of(:message) do
      resolve(fn _, _, _ ->
        {:ok, Testelixir.Chatroom.list_messages()}
      end)
    end
  end

  mutation do
    @desc "Create a user"
    field :create_user, :user do
      arg(:name, :string)
      arg(:email, :string)

      resolve(fn _, args, _ ->
        case Testelixir.Account.create_user(args) do
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
        case Testelixir.Account.get_user_by_id(args.id) do
          nil ->
            {:error, "User not found"}

          user ->
            case Testelixir.Account.update_user(user, args) do
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
        case Testelixir.Account.get_user_by_id(args.id) do
          nil ->
            {:error, "User not found"}

          user ->
            case Testelixir.Account.delete_user(user) do
              {:ok, user} -> {:ok, user}
              {:error, changeset} -> {:error, changeset}
            end
        end
      end)
    end

    @desc "Create a message"
    field :create_message, :message do
      arg(:content, :string)
      arg(:user_id, :id)

      resolve(fn _, args, _ ->
        case Testelixir.Chatroom.create_message(args) do
          {:ok, message} -> {:ok, message}
          {:error, changeset} -> {:error, changeset}
        end
      end)
    end

    @desc "Delete a message"
    field :delete_message, :message do
      arg(:id, :id)

      resolve(fn _, args, _ ->
        {:ok, Testelixir.Chatroom.delete_message(args.id)}
      end)
    end
  end
end
