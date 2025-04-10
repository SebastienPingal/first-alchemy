defmodule Testelixir.Chatroom.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :content, :string
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :user_id])
    |> validate_required([:content, :user_id])
    |> foreign_key_constraint(:user_id, name: "messages_user_id_fkey", message: "User does not exist")
  end
end
