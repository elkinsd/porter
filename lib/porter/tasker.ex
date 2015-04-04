defmodule Porter.Tasker do
  def task_loop do
    receive do
      {:done, from, work_response} ->
        IO.puts "Work done, #{inspect work_response} from #{inspect from}"
        work_response
      msg ->
        IO.puts "Got message, #{inspect self}, #{inspect msg}, looping"
        task_loop()
    end
  end

  def create_task(data) do
    Task.async(fn ->
      Porter.Server.add_task({:task, self, data})
      task_loop()
    end)
  end

  def get_value(task) do
    Task.await(task)
  end

  def create_tasks(data, number) do
    for f <- 1..number, do: create_task({f, data})
  end

  def get_values(tasks) do
    tasks |> Enum.map(fn task -> Task.await(task) end)
  end

  ## values = Tasker.create_tasks("this is a task", 5) |> Tasker.get_values()

end
