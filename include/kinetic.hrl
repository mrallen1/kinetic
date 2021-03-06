-ifndef(KINETIC_HRL).
-define(KINETIC_HRL, true).

-define(EXPIRATION_REFRESH, 120).
-define(KINETIC_DATA, kinetic_data).
-define(KINETIC_ARGS_KEY, args).

-define(KINESIS_MAX_PUT_SIZE, 51200).
-define(DEFAULT_OPERATION_TIMEOUT, 5000).


-record(kinetic_arguments, {
    region :: undefined | string(),
    date :: undefined | string(),
    host :: undefined | string(),
    url :: undefined | string(),
    lhttpc_opts = [] :: [any()],
    timeout :: undefined | pos_integer(),
    aws_credentials
}).

-endif.
