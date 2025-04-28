# NOTE: Load shared configuration
Code.require_file("mix/shared.exs")

defmodule Myumbrella.MixProject do
  use Mix.Project

  def project do
    [
      name: "Myumbrella",
      apps_path: "apps",
      version: Mix.Shared.version(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: Mix.Shared.test_coverage(),
      releases: [
        myumbrella: [
          applications: [
            app_1: :permanent,
            app_2: :permanent,
            app_web: :permanent
          ],
          steps: [:assemble, &Jellyfish.generate/1, :tar]
        ]
      ]
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    [
      # NOTE: Allows hotupgrade
      {:jellyfish, "~> 0.2.0"}
    ]
  end
end
