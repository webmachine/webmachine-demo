%% @author Andy Gross <andy@basho.com>
%% @author Justin Sheehy <justin@basho.com>

-module(webmachine_demo_app).

-behaviour(application).
-export([
    start/2,
    stop/1
]).

start(_Type, _StartArgs) ->
    webmachine_demo_sup:start_link().

stop(_State) ->
    ok.
