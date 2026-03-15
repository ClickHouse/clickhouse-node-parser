CREATE TABLE t0 (c0 Nullable(String)) ENGINE = MergeTree() ORDER BY tuple() SETTINGS allow_nullable_key = 1;
select * from system.mutations where database = currentDatabase() and not is_done format Vertical;
