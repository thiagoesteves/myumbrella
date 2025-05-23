defmodule Mix.Shared do
  def version, do: "0.2.2"

  def elixir, do: "~> 1.16"

  def elixirc_paths do
    if Mix.env() == :test do
      ["lib", "test/support"]
    else
      ["lib"]
    end
  end

  def test_coverage do
    [
      summary: [threshold: 94],
      ignore_modules: [
        # App 1

        # App 2

        # App Web

      ]
    ]
  end
end
