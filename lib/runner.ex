defmodule Runner do
  use GenServer

  @name Runner

  def start_link do
    GenServer.start(__MODULE__, [], name: @name)
  end

  def run(search) do
    GenServer.cast(__MODULE__, {:run, search})
  end
  def stats() do
    GenServer.call(RunnerServer, {:stats})
  end
  def clear() do
    GenServer.cast(RunnerServer, {:clear})
  end

  def init(state) do
    {:ok, state }
  end
  def handle_cast({:run, search}, state) do
    IO.puts "Searching #{search} sentiment...."
    stream = ExTwitter.stream_filter(track: search)
    |> Stream.map(fn (tweet)-> Sentient.analyze(tweet.text) end )
    sentiment = Enum.take(stream, 30) |> Enum.sum()
    IO.puts "#{search}: #{sentiment}"
    new_state = {String.to_atom(search), sentiment}
    GenServer.cast(RunnerServer, {:push, new_state})
    {:noreply, state}
  end

  def handle_info(_, state) do
    {:noreply, state}
  end

end
