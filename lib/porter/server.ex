defmodule Porter.Server do
  @moduledoc """
  Porter server to handle interaction between workers and tasks
  """
  use GenServer


  ## Client API

  @doc """
  Adds a `worker` to the Workers queue
  """
  def add_worker(worker) do
    GenServer.call(__MODULE__, {:add_worker, worker})
  end

  @doc """
  Gets a worker from the Workers queue
  """
  def get_worker do
    GenServer.call(__MODULE__, :get_worker)
  end

  @doc """
  Adds a task to the Tasks queue
  """
  def add_task(task) do
    GenServer.call(__MODULE__, {:add_task, task})
  end

  @doc """
  Gets a task from the Tasks queue
  """
  def get_task do
    GenServer.call(__MODULE__, :get_task)
  end


  ## Server Callbacks

  def start_link(tasks, workers, opts \\ []) do
    GenServer.start_link(__MODULE__, {tasks, workers}, opts)
  end

  def init(tasks, workers) do
    {:ok, %{tasks: tasks, workers: workers}}
  end

  def handle_call({:add_worker, worker}, _from, state) do
    Porter.Workers.add_worker(worker)
    if Porter.Tasks.tasks?, do: send(Porter.Server, :do_work)
    {:reply, :ok, state}
  end

  def handle_call(:get_worker, _from, state) do
    {:reply, Porter.Workers.get_worker, state}
  end

  def handle_call({:add_task, task}, from, state) do
    Porter.Tasks.add_task({:task, from, task})
    if Porter.Workers.workers?, do: send(Porter.Server, :do_work)
    {:reply, :ok, state}
  end

  def handle_call(:get_task, _from, state) do
    {:reply, Porter.Tasks.get_task, state}
  end

  def handle_info(:do_work, state) do
    case Porter.Workers.get_worker do
      nil -> true
      worker ->
        case Porter.Tasks.get_task do
          nil ->
            Porter.Workers.add_worker(worker)
          task ->
            send worker, task
        end
    end
      
    {:noreply, state}
  end

  def handle_info(msg, state) do
    IO.puts "Server self() got message: #{inspect msg}"
    {:noreply, state}
  end

end
