defmodule TestelixirWeb.Schema.Types.MessageType do
  use Absinthe.Schema.Notation

  scalar :datetime, description: "ISO 8601 Date Time" do
    serialize(&DateTime.to_iso8601/1)
    parse(&DateTime.from_iso8601/1)
  end

  object :message do
    field :id, :id
    field :content, :string
    field :user_id, :id
    field :inserted_at, :datetime
  end
end
