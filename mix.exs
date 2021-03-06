defmodule FlyingWithPhoenix.Mixfile do
  use Mix.Project

  def project do
    [
      app: :flying_with_phoenix,
      version: "0.0.1",
      elixir: "~> 1.2",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      aliases: aliases,
      deps: deps
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [ mod: {FlyingWithPhoenix, []},
      applications: [:phoenix, :phoenix_html, :cowboy, :edeliver, :logger,
                    :gettext, :phoenix_ecto, :postgrex, :mix]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:exrm,                           "1.0.0-rc7",
        override: true                                                        },
      {:conform,                        "1.0.0-rc8",
        override: true                                                        },
      {:conform_exrm,                   "~> 0.2.0"                            },
      {:edeliver,                       ">= 1.1.1"                            },
      {:phoenix,                        "~> 1.1.2"                            },
      {:phoenix_ecto,                   "~> 2.0"                              },
      {:postgrex,                       ">= 0.0.0"                            },
      {:phoenix_html,                   "~> 2.3"                              },
      {:phoenix_live_reload,            "~> 1.0",
        only: :dev                                                            },
      {:gettext,                        "~> 0.9"                              },
      {:cowboy,                         "~> 1.0"                              },
      # Simple libary for JSON fixtures...
      {:tacos,                          "~> 0.0.1",
      # Github is a supported source! Makes things easy, eh?
        github: "simble-app/tacos"                                            }
    ]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"]]
  end
end
