-module(webmachine_demo_config).

-export([
    dispatch/0,
    web_config/0
]).

-spec dispatch() -> [webmachine_dispatcher:route()].
dispatch() ->
    lists:flatten(
      [{["demo", '*'], webmachine_demo_resource, []},
       {["fs", '*'], webmachine_demo_fs_resource, [{root, "/tmp/fs"}]},
       {["upload", '*'], webmachine_demo_upload_resource, []}
    ]).

web_config() ->
    {ok, App} = application:get_application(?MODULE),
    {ok, Ip} = application:get_env(App, web_ip),
    {ok, Port} = application:get_env(App, web_port),
    [
        {ip, Ip},
        {port, Port},
        {log_dir, "priv/log"},
        {dispatch, dispatch()}
    ].
