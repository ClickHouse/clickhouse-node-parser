SELECT sleep(8)
FROM dist
SETTINGS
    function_sleep_max_microseconds_per_block = 8e9,
    prefer_localhost_replica = 0,
    receive_timeout = 7,
    async_socket_for_remote = 0,
    use_hedged_requests = 1
FORMAT Null;

SELECT sleep(8)
FROM dist
SETTINGS
    function_sleep_max_microseconds_per_block = 8e9,
    prefer_localhost_replica = 0,
    receive_timeout = 7,
    async_socket_for_remote = 1,
    use_hedged_requests = 0
FORMAT Null;

SELECT sleep(8)
FROM dist
SETTINGS
    function_sleep_max_microseconds_per_block = 8e9,
    prefer_localhost_replica = 0,
    receive_timeout = 7,
    async_socket_for_remote = 0,
    use_hedged_requests = 0
FORMAT Null;