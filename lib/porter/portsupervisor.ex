defmodule Porter.PortSupervisor do
  use Supervisor

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      supervisor(Task.Supervisor, [[name: Porter.TaskSupervisor]])
    ]
    opts = [strategy: :one_for_one]
    supervise(children, opts)
  end
end
