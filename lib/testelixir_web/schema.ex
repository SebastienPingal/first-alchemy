defmodule TestelixirWeb.Schema do
  use Absinthe.Schema

  import_types(TestelixirWeb.Schema.Types.UserType)

  query do
    field :users, list_of(:user) do
      resolve(fn _, _ ->
        {:ok,
         [
           %{id: 1, name: "Bob Benco", email: "bob@benco.com"},
           %{id: 2, name: "Ricky Framboise", email: "ricky@framboise.com"}
         ]}
      end)
    end
  end

  mutation do
    field :create_user, :user do
      arg :name, :string
      arg :email, :string

      resolve(fn _, args, _ ->
        {:ok, %{id: "3", name: args.name, email: args.email}}
      end)
    end
  end
end
