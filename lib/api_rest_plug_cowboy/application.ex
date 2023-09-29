defmodule ApiRestPlugCowboy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: ApiRestPlugCowboy.UserEndpoint,
        options: Application.get_env(:, :endPoint) [port:]
      )
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [
      strategy: :one_for_one,
      name: ApiRestPlugCowboy.Supervisor
    ]

    Supervisor.start_link(children, opts)
  end
end
