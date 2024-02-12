defmodule Mix.Tasks.GhTlsTest.Get do
  @moduledoc """
  Fetches the NPM dependencies listed in the mix.exs file
  """

  use Mix.Task

  @impl true
  def run(_args) do
    {:ok, _} = Application.ensure_all_started(:req)
    {:ok, _} = Application.ensure_all_started(:inets)
    {:ok, _} = Application.ensure_all_started(:ssl)

    # can get https://registry.npmjs.org with req
    %Req.Response{status: 200} = Req.get!("https://registry.npmjs.org")
    IO.puts("ok")

    # can get https://registry.npmjs.org with httpc
    url = ~c"https://registry.npmjs.org"

    http_request_opts = [
      ssl: [
        verify: :verify_peer,
        cacertfile: String.to_charlist(CAStore.file_path()),
        customize_hostname_check: [
          match_fun: :public_key.pkix_verify_hostname_match_fun(:https)
        ]
      ]
    ]

    {:ok, {{_, 200, _}, _, _}} = :httpc.request(:get, {url, []}, http_request_opts, [])
    IO.puts("ok")
  end
end
