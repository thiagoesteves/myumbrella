defmodule App2.Worker do
  @moduledoc false

  use GenServer
  require Logger

  ### ==========================================================================
  ### Callback functions
  ### ==========================================================================

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(_args) do
    Logger.info("Initialising App1 server")

    interval = 2_000

    schedule_new_deployment(interval)

    {:ok, %{interval: interval}}
  end

  @impl true
  def handle_info(:schedule, state) do
    schedule_new_deployment(state.interval)

    Logger.info("Running #{__MODULE__} Scheduler (/•ิ_•ิ) 🔥 (╯°□°)╯ 🔥 (╯°□°)╯ ##### ")

    {:noreply, state}
  end

  ### ==========================================================================
  ### Public API
  ### ==========================================================================

  ### ==========================================================================
  ### Private functions
  ### ==========================================================================

  defp schedule_new_deployment(timeout), do: Process.send_after(self(), :schedule, timeout)
end
