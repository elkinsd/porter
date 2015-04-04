defmodule Porter.Supervisor do
  @moduledoc """
  Supervisor
  """
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  @task_agent Porter.Tasks
  @worker_agent Porter.Workers
  @server_name Porter.Server
  @worker_supervisor Porter.WorkSupervisor
  @worker_num 8

  def init(:ok) do
    children = [
      worker(Porter.Tasks, [], [name: @task_agent]),
      worker(Porter.Workers, [], [name: @worker_agent]),
      worker(Porter.Server, [@task_agent, @worker_agent, [name: @server_name]]),
      supervisor(Porter.WorkSupervisor, [@worker_num, [name: @worker_supervisor]])
    ]

    supervise(children, strategy: :one_for_one, restart: :permanent)
  end
end
