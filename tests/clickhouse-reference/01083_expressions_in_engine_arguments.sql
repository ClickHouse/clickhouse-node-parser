-- The following line is needed just to disable checking stderr for emptiness
SELECT nonexistentsomething; -- { serverError UNKNOWN_IDENTIFIER }
-- remote(localhost) --> cluster(test_shard_localhost) |-> remote(127.0.0.1) --> view |-> subquery --> merge |-> distributed --> file (1)
--                                                     |                              |                      |-> distributed_tf -> buffer (1) -> file (1)
--                                                     |                              |-> file (1)
--                                                     |-> remote(127.0.0.2) --> ...
SELECT sum(n) from rich_syntax settings enable_parallel_replicas=0;
SELECT sum(n) from rich_syntax settings serialize_query_plan=0;
