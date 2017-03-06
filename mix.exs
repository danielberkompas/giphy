defmodule Giphy.Mixfile do
  use Mix.Project

  def project do
    [app: :giphy,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
    
     # Docs
     name: "Giphy",
     source_url: "https://github.com/danielberkompas/giphy",
     homepage_url: "http://github.com/danielberkompas/giphy",
     docs: [main: "Giphy", extras: ["README.md"]]
    ]
  end

  def application do
    [extra_applications: [:logger, :httpoison],
     mod: {Giphy.Application, []}]
  end

  defp deps do
    [{:httpoison, "~> 0.11"},
     {:poison, "~> 3.1"},
     {:calendar, "~> 0.16"},
     {:ex_doc, "~> 0.12", only: :dev, runtime: false},
     {:inch_ex, "~> 0.5", only: :docs, runtime: false}]
  end
end
