defmodule Twitter do
  use Application

  def start(_, _) do
    RunnerSupervisor.start_link 
  end
end
