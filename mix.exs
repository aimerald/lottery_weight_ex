defmodule WeightLottery.MixProject do
  use Mix.Project

	@description """
	  Elixir library for weighted drawing
  """

  def project do
    [
      app: :weight_lottery,
      version: "0.1.0",
      elixir: "~> 1.6",
			name: "weight_lottery",
			description: @description,
			build_embedded: Mix.env == :prod,
			start_permanent: Mix.env == :prod,
      deps: deps(),
			package: [
				maintainers: ["aimerald"],
				licenses: ["MIT"],
				links: %{ "Github" => "https://github.com/aimerald/lottery_weight_ex" }
			]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
		[
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
