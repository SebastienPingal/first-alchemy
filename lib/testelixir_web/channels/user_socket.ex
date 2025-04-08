defmodule TestelixirWeb.UserSocket do
  use Phoenix.Socket
  use Absinthe.Phoenix.Socket, schema: TestelixirWeb.Schema

  # The "__absinthe__" channel is used for GraphQL subscriptions
  # It's a special channel that handles GraphQL subscriptions
  # The asterisk (*) is a wildcard that allows for dynamic topics like "__absinthe__:123"
  channel "__absinthe__", Absinthe.Phoenix.Channel

  # The connect function is called when a client attempts to establish a WebSocket connection
  # params - Contains data sent by the client when connecting (like authentication tokens)
  # socket - The initial socket state
  def connect(params, socket) do
    # Authorize the connection and setup initial socket state
    # Here we're storing the user_id (passed from client) in the socket assigns
    # This makes the user_id available in all future communications on this socket
    socket = socket
      |> assign(:user_id, params["user_id"])
      |> Absinthe.Phoenix.Socket.put_options(context: %{current_user: params["user_id"]})

    {:ok, socket}
  end

  # The id function generates a unique identifier for this socket connection
  # This is used for identifying the socket if you need to force-disconnect or
  # broadcast to a specific user later
  def id(socket) do
    "users_socket:#{socket.assigns[:user_id] || "anonymous"}"
  end
end
