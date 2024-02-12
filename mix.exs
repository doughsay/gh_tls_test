defmodule GhTlsTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :gh_tls_test,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      npm_deps: npm_deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :inets, :ssl, :public_key]
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
      # {:sweet_xml, "~> 0.7"},
      {:npm_deps, "~> 0.3"}
    ]
  end

  defp aliases do
    [
      "deps.get": ["deps.get", "npm_deps.get"]
    ]
  end
end
