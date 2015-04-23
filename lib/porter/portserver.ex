defmodule Porter.PortServer do
  @moduledoc """
  Server to communicate with ports, aka outside processes like perl portserver.pl
  """
  use GenServer

  def command(server,data) do
    GenServer.call(server, {:command, data})
  end

  def start_link(command, listener, opts \\ []) do
    GenServer.start_link(__MODULE__, {command, listener}, opts)
  end

  def init({command, listener}) do
    port = Port.open({:spawn, command}, [:stream, :binary, :exit_status])
    IO.inspect Port.info(port)
    {:ok, %{port: port, listener: listener}}
  end

  def handle_call({:command, data}, {pid,_ref} = from , state) do
    Port.command(state.port, "CALLER: #{inspect from}\n")
    Port.command(state.port, "#{inspect data}\n")
    Port.command(state.port, "EOL\n")
    {:reply, :ok, %{state| listener: pid}}
  end

  def handle_info(msg, state) do
    IO.puts "PortServer got message: #{inspect msg}"
    send state.listener, msg
    {:noreply, state}
  end

end
