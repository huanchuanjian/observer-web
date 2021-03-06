%%%----------------------------------------------------------------------------
%%% @author Bill Wang <freecnpro@gmail.com>
%%% @copyright 2014 Freecnpro
%%% @doc
%%% @end
%%%----------------------------------------------------------------------------

-module(observer_web_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
	ObserverPro = {observer_pro_web, {observer_pro_web, start_link, []}, permanent, 2000, worker, [observer_pro_web]},
	Procs = [ObserverPro],
	{ok, {{one_for_one, 10, 10}, Procs}}.