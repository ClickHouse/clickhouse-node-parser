SELECT count(b) * count(b) IGNORE NULLS FROM (SELECT b FROM test);
SELECT avg(b) * 3, (sum(b) + 1) + count(b), count(b) * count(b), count() IGNORE NULLS FROM (SELECT b FROM test);
SELECT sum(b), count(b), sum(a), count(a) FROM (SELECT a, b FROM test);
SELECT sum(a), count(a) FROM ( SELECT CAST(materialize(1), 'LowCardinality(Nullable(Int32))') AS a) t;
