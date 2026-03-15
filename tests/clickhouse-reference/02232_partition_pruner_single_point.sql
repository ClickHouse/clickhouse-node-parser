CREATE TABLE lower_test (
    a Int32,
    b String
) ENGINE=MergeTree
PARTITION BY b
ORDER BY a;
SELECT a FROM lower_test WHERE lower(b) IN ('a','b') order by a;
