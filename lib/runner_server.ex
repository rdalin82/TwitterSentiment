defmodule RunnerServer do
  use GenServer

  @name RunnerServer

  def start_link do
    GenServer.start(__MODULE__, [], name: @name)
  end

  def handle_call({:stats}, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:push, new_state}, state) do
    {:noreply, [new_state | state]}
  end

  def handle_cast({:clear}, state) do
    {:noreply, []}
  end
end
