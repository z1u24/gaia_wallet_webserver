%%@doc 全局调用表模块
%%@end


-module(zm_call).

-description("call table").
-copyright({seasky,'www.seasky.cn'}).
-author({zmyth,leo,'zmythleo@gmail.com'}).


%%%=======================EXPORT=======================
-export([get/1, set/4, unset/4]).
-export([c/2, c/3, c/4, c/5, c/6, c/7, c/8, c/9, cc/2]).

%%%=================EXPORTED FUNCTIONS=================
%% -----------------------------------------------------------------
%%@doc 获得表中指定键的值
%% @spec get(Type) -> return()
%% where
%%      return() = none | tuple()
%%@end
%% -----------------------------------------------------------------
get(Type) ->
	try ets:lookup(?MODULE, Type) of
		[T] -> T;
		[] -> none
	catch
		error:badarg -> none
	end.

%% -----------------------------------------------------------------
%%@doc 批量设置表
%% @spec set(Table::atom(),M, F, A) -> ok
%% where
%%      option() = ordered_set | keypos2 | named_table
%%@end
%% -----------------------------------------------------------------
set(Type, M, F, A) when is_atom(M), is_atom(F) ->
	zm_config:set(?MODULE, {Type, M, F, A}).

%% -----------------------------------------------------------------
%%@doc 取消批量设置表
%% @spec unset(Table::atom(),M, F, A) -> ok
%%@end
%% -----------------------------------------------------------------
unset(Type, M, F, A) ->
	zm_config:unset(?MODULE, {Type, M, F, A}).

%% -----------------------------------------------------------------
%%@doc 调用指定的类型对应的函数(MFA)
%% @spec c(Type::any(), A1::any()) -> any()
%%@end
%% -----------------------------------------------------------------
c(Type, A1) ->
	[{_, M, F, A}] = ets:lookup(?MODULE, Type),
	M:F(A, A1).

%% -----------------------------------------------------------------
%%@doc 调用指定的类型对应的函数(MFA)
%% @spec c(Type::any(), A1::any(), A2::any()) -> any()
%%@end
%% -----------------------------------------------------------------
c(Type, A1, A2) ->
	[{_, M, F, A}] = ets:lookup(?MODULE, Type),
	M:F(A, A1, A2).

%% -----------------------------------------------------------------
%%@doc 调用指定的类型对应的函数(MFA)
%% @spec c(Type::any(), A1::any(), A2::any(), A3::any()) -> any()
%%@end
%% -----------------------------------------------------------------
c(Type, A1, A2, A3) ->
	[{_, M, F, A}] = ets:lookup(?MODULE, Type),
	M:F(A, A1, A2, A3).

%% -----------------------------------------------------------------
%%@doc 调用指定的类型对应的函数(MFA)
%% @spec c(Type::any(), A1::any(), A2::any(), A3::any(), A4::any()) -> any()
%%@end
%% -----------------------------------------------------------------
c(Type, A1, A2, A3, A4) ->
	[{_, M, F, A}] = ets:lookup(?MODULE, Type),
	M:F(A, A1, A2, A3, A4).

%% -----------------------------------------------------------------
%%@doc 调用指定的类型对应的函数(MFA)
%% @spec c(Type::any(), A1::any(), A2::any(), A3::any(), A4::any(), A5::any()) -> any()
%%@end
%% -----------------------------------------------------------------
c(Type, A1, A2, A3, A4, A5) ->
	[{_, M, F, A}] = ets:lookup(?MODULE, Type),
	M:F(A, A1, A2, A3, A4, A5).

%% -----------------------------------------------------------------
%%@doc 调用指定的类型对应的函数(MFA)
%% @spec c(Type::any(), A1::any(), A2::any(), A3::any(), A4::any(), A5::any(), A6::any()) -> any()
%%@end
%% -----------------------------------------------------------------
c(Type, A1, A2, A3, A4, A5, A6) ->
	[{_, M, F, A}] = ets:lookup(?MODULE, Type),
	M:F(A, A1, A2, A3, A4, A5, A6).

%% -----------------------------------------------------------------
%%@doc 调用指定的类型对应的函数(MFA)
%% @spec c(Type::any(), A1::any(), A2::any(), A3::any(), A4::any(), A5::any(), A6::any(), A7::any()) -> any()
%%@end
%% -----------------------------------------------------------------
c(Type, A1, A2, A3, A4, A5, A6, A7) ->
	[{_, M, F, A}] = ets:lookup(?MODULE, Type),
	M:F(A, A1, A2, A3, A4, A5, A6, A7).

%% -----------------------------------------------------------------
%%@doc 调用指定的类型对应的函数(MFA)
%% @spec c(Type::any(), A1::any(), A2::any(), A3::any(), A4::any(), A5::any(), A6::any(), A7::any(), A8::any()) -> any()
%%@end
%% -----------------------------------------------------------------
c(Type, A1, A2, A3, A4, A5, A6, A7, A8) ->
	[{_, M, F, A}] = ets:lookup(?MODULE, Type),
	M:F(A, A1, A2, A3, A4, A5, A6, A7, A8).

%% -----------------------------------------------------------------
%%@doc 调用指定的类型对应的函数(MFA)
%% @spec cc(Type::any(), Args::any()) -> any()
%%@end
%% -----------------------------------------------------------------
cc(Type, Args) when is_list(Args) ->
	[{_, M, F, A}] = ets:lookup(?MODULE, Type),
	apply(M, F, [A | Args]).