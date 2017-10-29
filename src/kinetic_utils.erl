-module(kinetic_utils).
-export([endpoint/2, decode/1, encode/1]).

-define(JSONE_OPTS, [{object_format, tuple}]).


endpoint("kinesis", "us-east-1") -> "kinesis.us-east-1.amazonaws.com";
endpoint("kinesis", "us-west-1") -> "kinesis.us-west-1.amazonaws.com";
endpoint("kinesis", "us-west-2") -> "kinesis.us-west-2.amazonaws.com";
endpoint("kinesis", "eu-west-1") -> "kinesis.eu-west-1.amazonaws.com";
endpoint("kinesis", "ap-northeast-1") -> "kinesis.ap-northeast-1.amazonaws.com";
endpoint("kinesis", "ap-southeast-1") -> "kinesis.ap-southeast-1.amazonaws.com".


decode(<<"">>) ->
    [];
decode(Body) ->
    try jsone:decode(Body, ?JSONE_OPTS) of
        {Decoded} -> % enforces the dictionary
            Decoded;

        _ ->
            {error, not_a_dict}
    catch
        {error, E} ->
            {error, E};
        _:E0 ->
            {error, E0}
    end.


encode(Body) ->
    try jsone:encode(Body)
    catch
        {error, E0} ->
            {error, E0};
        _:E ->
            {error, E}
    end.
