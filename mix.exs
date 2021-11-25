defmodule MyXQL.MixProject do
  use Mix.Project

  @version "0.5.1"
  @source_url "https://github.com/elixir-ecto/myxql"

  def project() do
    [
      app: :myxql,
      version: @version,
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      name: "MyXQL",
      description: "MySQL 5.5+ driver for Elixir",
      source_url: @source_url,
      package: package(),
      docs: docs(),
      deps: deps()
    ]
  end

  def application() do
    [
      extra_applications: [:ssl, :public_key],
      env: [
        json_library: Jason
      ]
    ]
  end

  defp package() do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs() do
    [
      source_ref: "v#{@version}",
      main: "readme",
      extras: ["README.md"]
    ]
  end

  defp deps() do
    [
      {:db_connection, "~> 2.4.1", db_connection_opts()},
      {:decimal, "~> 2.0.0"},
      {:jason, github: "michalmuskala/jason", ref: "df949728f9e3b36289329ae364b6f9738dd3ad34", optional: true, override: true},
      {:geo, "~> 3.4.2", optional: true},
      {:binpp, "~> 1.1.1", only: [:dev, :test]},
      {:dialyxir, "~> 1.1.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.23.0", only: :dev, runtime: false},
      {:benchee, "~> 1.0.1", only: :dev, runtime: false}
    ]
  end

  defp db_connection_opts() do
    if path = System.get_env("DB_CONNECTION_PATH") do
      [path: path]
    else
      []
    end
  end
end
