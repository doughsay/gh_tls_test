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
