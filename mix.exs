defmodule Rummage.Phoenix.Mixfile do
  use Mix.Project

  @version "2.0.0-rc.0"
  @elixir "~> 1.6"
  @url "https://github.com/aditya7iyengar/rummage_phoenix"

  def project do
    [
      app: :rummage_phoenix,
      version: @version,
      elixir: @elixir,
      deps: deps(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,

      # Test
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test],
      aliases: aliases(),
      elixirc_paths: elixirc_paths(Mix.env()),

      # Hex
      description: description(),
      package: package(),

      # Docs
      name: "Rumamge.Phoenix",
      docs: docs()
    ]
  end

  def application do
    [
      applications: [
        :logger,
        :phoenix_html,
        :phoenix
        # :rummage_ecto,
      ]
    ]
  end

  def package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Adi Iyengar"],
      licenses: ["MIT"],
      links: %{"Github" => @url}
    ]
  end

  defp deps do
    [
      # Development Dependencies
      {:phoenix, "~> 1.3.0"},
      {:phoenix_html, "~> 2.11"},

      # Other Dependencies
      {:credo, "~> 0.9.1", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:excoveralls, "~> 0.8", only: :test, runtime: false},
      {:inch_ex, "~> 0.5", only: [:dev, :test, :docs], runtime: false},
      {:postgrex, "~> 0.13", only: :test, optional: true, runtime: false}
      # {:rummage_ecto, "~> 2.0.0-rc.0"},
      # {:rummage_ecto, path: "../rummage_ecto"},
    ]
  end

  defp description do
    """
    A Support library for Rummage.Ecto to add Search, Sort and Pagination to
    Phoenix apps using HTML and Views/Controllers.
    """
  end

  def docs do
    [
      main: "Rummage.Phoenix",
      source_url: @url,
      extras: [
        "README.md",
        "CHANGELOG.md",
        "docs/Nomenclature.md",
        "docs/Walkthrough.md"
      ],
      source_ref: "v#{@version}"
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.setup --quite", "test"]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "priv", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
