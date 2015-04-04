defmodule Porter.Tasks do

  def start_link do
    Agent.start_link(fn -> %{tasks: [], number: 0} end, name: __MODULE__)
  end

  def add_task(task) do
    Agent.update(__MODULE__, fn %{tasks: list, number: number} -> %{tasks: List.insert_at(list,-1,task), number: number+1} end)
  end

  def get_task do
    Agent.get_and_update(__MODULE__, fn %{tasks: list, number: number} ->
      case list do
        [head|tail] -> {head, %{tasks: tail, number: number-1}}
        [] -> {nil, %{tasks: [], number: 0}}
      end
    end)
  end

  def tasks? do
    case Agent.get(__MODULE__, fn %{number: number} -> number end) do
      0 -> false
      _ -> true
    end
  end

end
