defmodule Testelixir.ChatroomFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Testelixir.Chatroom` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> Testelixir.Chatroom.create_message()

    message
  end
end
