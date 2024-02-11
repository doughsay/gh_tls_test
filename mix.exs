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
      {:absinthe_plug, "~> 1.5"},
      {:absinthe_relay, "~> 1.5"},
      {:absinthe, "~> 1.7"},
      {:argon2_elixir, "~> 4.0"},
      {:bandit, "~> 1.0"},
      {:castore, ">= 0.0.0"},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dataloader, "~> 2.0"},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:earmark, "~> 1.4"},
      {:ecto_psql_extras, "~> 0.6"},
      {:ecto_sql, "~> 3.6"},
      {:esbuild, "~> 0.7", runtime: Mix.env() == :dev},
      {:ex_fontawesome, "~> 0.7"},
      {:ex_machina, "~> 2.7", only: [:dev, :test]},
      {:excoveralls, "~> 0.10", only: :test},
      {:faker, "~> 0.17", only: [:dev, :test]},
      {:familiar, "~> 0.1"},
      {:file_size, "~> 3.0"},
      {:finch, "~> 0.13"},
      {:floki, ">= 0.30.0"},
      {:gettext, "~> 0.20"},
      {:hashids, "~> 2.0"},
      {:jason, "~> 1.2"},
      {:natural_order, "~> 0.3"},
      {:npm_deps, "~> 0.3", runtime: false},
      {:oban, "~> 2.11"},
      {:phoenix_ecto, "~> 4.4"},
      {:phoenix_html, "~> 4.0", override: true},
      {:phoenix_live_dashboard, "~> 0.8"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.19"},
      {:phoenix, "~> 1.7.0"},
      {:postgrex, ">= 0.0.0"},
      {:req, "~> 0.3"},
      {:styler, "~> 0.8", only: [:dev, :test], runtime: false},
      {:sweet_xml, "~> 0.7"},
      # {:swoosh, "~> 1.3"},
      {:tailwind_formatter, "~> 0.4.0", only: [:dev, :test], runtime: false},
      {:tailwind, "~> 0.2", runtime: Mix.env() == :dev},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"}
    ]
  end

  defp aliases do
    [
      "deps.get": ["deps.get", "npm_deps.get"]
    ]
  end
end
