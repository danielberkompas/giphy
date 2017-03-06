defmodule Giphy.Mixfile do
  use Mix.Project

  def project do
    [app: :giphy,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     package: package(),
    
     # Docs
     name: "Giphy",
     description: "Elixir wrapper for the Giphy API",
     source_url: "https://github.com/danielberkompas/giphy",
     homepage_url: "http://github.com/danielberkompas/giphy",
     docs: [main: "Giphy", extras: ["README.md"]],
    ]
  end

  def application do
    [extra_applications: [:logger, :httpoison],
     mod: {Giphy.Application, []}]
  end

  def package do
    [maintainers: ["Daniel Berkompas"],
     licenses: ["MIT"],
     links: %{
       "Github" => "https://github.com/danielberkompas/giphy"
     }]
  end

  defp deps do
    [{:httpoison, "~> 0.11"},
     {:poison, "~> 3.1"},
     {:calendar, "~> 0.16"},
     {:ex_doc, "~> 0.12", only: :dev, runtime: false},
     {:inch_ex, "~> 0.5", only: :docs, runtime: false}]
  end
end
