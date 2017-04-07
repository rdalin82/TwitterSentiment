defmodule RunnerSupervisor do
  use Supervisor
  @name RunnerSupervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: @name)
  end

  def init([]) do
    children = [
      worker(Runner, [], name: :runner),
      worker(RunnerServer, [], name: :runner_server)
    ]
    supervise(children, [strategy: :one_for_all, name: RunnerSupervisor])
  end
end
