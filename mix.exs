defmodule GhTlsTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :gh_tls_test,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      npm_deps: npm_deps(),
      npm_deps: npm_deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.html": :test,
        "coveralls.lcov": :test
      ],
      dialyzer: [
        plt_add_apps: [:mix, :ex_unit]
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {GhTlsTest.Application, []},
      extra_applications: [:logger]
    ]
  end

  def npm_deps do
    [
      {:topbar, "2.0.2"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:castore, ">= 0.0.0"},
      {:req, "~> 0.4"},
      {:npm_deps, "~> 0.3", runtime: false}
    ]
  end

  defp aliases do
    [
      "deps.get": ["deps.get", "npm_deps.get"]
    ]
  end
end
