defmodule Porter.WorkSupervisor do
  use Supervisor

  def start_link(worker_num, opts \\ []) do
    Supervisor.start_link(__MODULE__, worker_num, opts)
  end

  @work_command "perl perl/portserver.pl"

  def init(worker_num) do
    children = Enum.map(1..worker_num, fn (n) ->
      worker(Porter.Worker, [@work_command], id: "Worker#{n}")
    end)
    opts = [strategy: :one_for_one, restart: :permanent]
    supervise(children, opts)
  end
end
