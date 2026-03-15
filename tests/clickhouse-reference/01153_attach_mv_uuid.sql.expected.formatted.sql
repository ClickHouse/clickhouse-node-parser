CREATE TABLE src
(
    n UInt64
)
ENGINE = MergeTree
ORDER BY n;

CREATE MATERIALIZED VIEW mv
(
    n Int32,
    n2 Int64
)
ENGINE = MergeTree
ORDER BY n
PARTITION BY n % 10
AS
SELECT
    n,
    n * n AS n2
FROM src;

SELECT *
FROM mv
ORDER BY n ASC;

SET database_replicated_allow_explicit_uuid = 3;

SET show_table_uuid_in_table_create_query_if_not_nil = 1;

CREATE TABLE `.inner_id.e15f3ab5-6cae-4df3-b879-f40deafd82c2`
(
    n Int32,
    n2 Int64
)
ENGINE = MergeTree
ORDER BY n
PARTITION BY n % 10;

CREATE TABLE `.inner_id.e15f3ab5-6cae-4df3-b879-f40deafd82c2`
(
    n Int32,
    n2 Int64
)
ENGINE = MergeTree
ORDER BY n
PARTITION BY n % 10;