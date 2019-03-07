defmodule ExFigures.MixProject do
  use Mix.Project

  @version "0.1.0"
  @project_url "https://github.com/elfenlaid/ex_figures"

  def project do
    [
      app: :ex_figures,
      version: @version,
      elixir: "~> 1.6",
      description: "Elixir wrapper for Appfigures API",
      source_ref: "v#{@version}",
      source_url: @project_url,
      homepage_url: @project_url,
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      build_embedded: Mix.env() == :prod,
      package: package(),
      docs: docs(),
      dialyzer: dializer(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:tesla, "~> 1.2.1"},
      {:hackney, "~> 1.14.0"},
      {:jason, ">= 1.0.0"},

      # testing & docs
      {:ex_doc, "~> 0.19", only: :dev},
      {:mix_test_watch, "~> 0.9", only: :dev},
      {:dialyxir, "~> 1.0.0-rc.3", only: [:dev, :test], runtime: false},
      {:inch_ex, "~> 2.0.0", only: :dev}
    ]
  end

  defp package() do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Egor Mihnevich"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @project_url
      }
    ]
  end

  defp docs() do
    [main: "readme", extras: ["README.md"]]
  end

  defp dializer() do
    [
      plt_add_deps: :project,
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"},
      flags: ["-Wunmatched_returns", :error_handling, :race_conditions, :underspecs]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
