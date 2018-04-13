defmodule Undocumented.MixProject do
  use Mix.Project

  def project do
    [
      app: :undocumented,
      version: "0.1.0",
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      name: "Undocumented",
      description: description(),
      package: package(),
      source_url: "https://www.github.com/njichev/undocumented",
      homepage_url: "https://www.github.com/njichev/undocumented",
      deps: deps()
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
    []
  end

  defp elixirc_paths(:test), do: ["lib", "test/fixtures"]
  defp elixirc_paths(_), do: ["lib"]

  defp description() do
    "A library for tracking missing documentation."
  end

  defp package() do
    [
      maintainers: ["njichev@gmail.com"],
      licenses: ["MIT"],
      links: %{github: "https://www.github.com/njichev/undocumented"}
    ]
  end
end
