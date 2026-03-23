CREATE TABLE src (n UInt64) ENGINE=MergeTree ORDER BY n;
CREATE MATERIALIZED VIEW mv (n Int32, n2 Int64) ENGINE = MergeTree PARTITION BY n % 10 ORDER BY n AS SELECT n, n * n AS n2 FROM src;
INSERT INTO src VALUES (1), (2);
SELECT * FROM mv ORDER BY n;
INSERT INTO src VALUES (3), (4);
SET database_replicated_allow_explicit_uuid=3;
SET show_table_uuid_in_table_create_query_if_not_nil=1;
CREATE TABLE ".inner_id.e15f3ab5-6cae-4df3-b879-f40deafd82c2" (n Int32, n2 Int64) ENGINE = MergeTree PARTITION BY n % 10 ORDER BY n;
CREATE TABLE ".inner_id.e15f3ab5-6cae-4df3-b879-f40deafd82c2" UUID '3bd68e3c-2693-4352-ad66-a66eba9e345e' (n Int32, n2 Int64) ENGINE = MergeTree PARTITION BY n % 10 ORDER BY n;
