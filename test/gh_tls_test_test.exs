defmodule GhTlsTestTest do
  use ExUnit.Case

  test "can get https://registry.npmjs.org with req" do
    assert %Req.Response{status: 200} = Req.get!("https://registry.npmjs.org")
  end

  test "can get https://registry.npmjs.org with httpc" do
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

    assert {:ok, {{_, 200, _}, _, _}} = :httpc.request(:get, {url, []}, http_request_opts, [])
  end
end
