CREATE TABLE a (key Nullable(String)) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE b (key Nullable(String)) ENGINE = MergeTree ORDER BY tuple();
SELECT a.key FROM a LEFT SEMI JOIN b ON tuple(a.key) = tuple(b.key) ORDER BY a.key;
SELECT a.key FROM a LEFT SEMI JOIN b ON a.key IS NOT DISTINCT FROM b.key ORDER BY a.key;
SELECT a.key FROM a LEFT ANY JOIN b ON tuple(a.key) = tuple(b.key) ORDER BY a.key;
