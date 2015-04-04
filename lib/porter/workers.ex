defmodule Porter.Workers do

  def start_link do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def add_worker(worker) do
    Agent.update(__MODULE__, fn list -> List.insert_at(list,-1,worker) end)
  end

  def get_worker do
    Agent.get_and_update(__MODULE__, fn list ->
      case list do
        [head|tail] -> {head, tail}
        [] -> {nil,[]}
      end
    end)
  end

  def workers? do
    case Agent.get(__MODULE__, fn list -> length list end) do
      0 -> false
      _ -> true
    end
  end

end
