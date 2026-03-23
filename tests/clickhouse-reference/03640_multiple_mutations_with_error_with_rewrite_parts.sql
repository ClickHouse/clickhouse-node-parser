-- https://github.com/ClickHouse/ClickHouse/issues/88150
DROP TABLE IF EXISTS t0;
CREATE TABLE t0 (c0 Nullable(String)) ENGINE = MergeTree() ORDER BY tuple() SETTINGS allow_nullable_key = 1;
INSERT INTO TABLE t0 (c0) VALUES ('a');
select * from system.mutations where database = currentDatabase() and not is_done format Vertical;
