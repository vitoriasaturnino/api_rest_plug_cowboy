defmodule ApiRestPlugCowboy.MixProject do
  use Mix.Project

  def project do
    [
      app: :api_rest_plug_cowboy,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ApiRestPlugCowboy.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.3", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.21.3", only: :dev, runtime: false},
      {:inch_ex, github: "rrrene/inch_ex", only: [:dev, :test]},
      {:excoveralls, "~> 0.12.3", only: :test}
    ]
  end

  def aliases do
    [
      test_ci: [
        "test",
        "coveralls"
      ],
      code_review: [
        "dialyzer",
        "credo --strict"
      ],
      generate_docs: [
        "docs",
        "inch"
      ]
    ]
  end
end
