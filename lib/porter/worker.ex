defmodule Porter.Worker do
  use GenServer

  def rand(limit) do
    {x,y,z} = :erlang.now
    :random.seed(x,y,z)
    :random.uniform(limit)
  end

  def start_link(command, opts \\ []) do
    GenServer.start_link(__MODULE__, command, opts)
  end

  def init(command) do
    {:ok, port} = Porter.PortServer.start_link(command, self())
    ##IO.inspect port
    Porter.Server.add_worker(self())
    {:ok, %{port: port}}
  end

  def task_loop(), do: task_loop([])
  def task_loop(acc) do
    receive do
      {_from, {:data, msg}} ->
        msgs = String.split(msg, "\n", trim: true)
        acc = List.flatten [msgs|acc]
        if List.last(msgs) == "EOL" do
          Enum.reverse acc
        else
          task_loop(acc)
        end
      _ ->
        task_loop(acc)
    end
  end

  def handle_info({:task, {pid,ref} = from, data}, state) do
    ##IO.puts "Got task: #{inspect from} #{inspect data}"
    ##:timer.sleep(rand(150))

## ok now let's send data to the port
    task = Task.async(fn ->
      Porter.PortServer.command(state.port, data)
      task_loop()
    end)
    value = Task.await(task)
    IO.puts "value: #{inspect value}"

    send pid, {:done, self, value}
    Porter.Server.add_worker(self())

    {:noreply, state}
  end

  def handle_info(msg, state) do
    IO.puts "Worker #{inspect self} got message: #{inspect msg}"
    {:noreply, state}
  end

end
