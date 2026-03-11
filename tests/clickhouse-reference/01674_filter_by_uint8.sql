-- ORDER BY is to trigger comparison at uninitialized memory after bad filtering.
SELECT ignore(number) FROM numbers(256) ORDER BY arrayFilter(x -> materialize(255), materialize([257])) LIMIT 1;
SELECT ignore(number) FROM numbers(256) ORDER BY arrayFilter(x -> materialize(255), materialize(['257'])) LIMIT 1;
SELECT count() FROM numbers(256) WHERE toUInt8(number);
SELECT * FROM t_filter WHERE f ORDER BY u LIMIT 5;
SELECT * FROM t_filter WHERE f != 0 ORDER BY u LIMIT 5;
