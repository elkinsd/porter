defmodule PorterTest do
  use ExUnit.Case, async: true
  doctest Porter

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "creates task and gets value" do
    value = Porter.Tasker.create_task("this is my task data") |> Porter.Tasker.get_value
    assert value != false
#    assert value == "this is the work results! data: \"this is my task data\""
  end

  test "creates tasks and gets values" do
    limit = 2
    values = Porter.Tasker.create_tasks("data", limit) |> Porter.Tasker.get_values
    assert length(values) == limit
#    check_values = Enum.map 1..limit, fn (n) -> "this is the work results! data: {#{n}, \"data\"}" end
#    assert values == check_values
  end

  @tag timeout: 60000
  test "creates a lot of tasks and gets the values" do
    limit = 50
    values = Porter.Tasker.create_tasks("data2", limit) |> Porter.Tasker.get_values
    assert length(values) == limit
#    check_values = Enum.map 1..limit, fn (n) -> "this is the work results! data: {#{n}, \"data2\"}" end
#    assert values == check_values
  end

end
