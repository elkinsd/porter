defmodule Porter do
  @moduledoc """
  Porter
  """
  use Application

  def start(_type, _args) do
    Porter.Supervisor.start_link
  end

end
