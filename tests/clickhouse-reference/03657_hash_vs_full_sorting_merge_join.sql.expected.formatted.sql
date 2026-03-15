CREATE TABLE t1
(
    key UInt32,
    s String
)
ENGINE = TinyLog;

CREATE TABLE tn1
(
    key Nullable(UInt32),
    s String
)
ENGINE = TinyLog;

CREATE TABLE t2
(
    key UInt32,
    s String
)
ENGINE = TinyLog;

CREATE TABLE tn2
(
    key Nullable(UInt32),
    s String
)
ENGINE = TinyLog;

SET enable_analyzer = 1;

SET join_algorithm = 'hash';

SELECT '---';

SELECT
    key,
    length(t1.s),
    length(t2.s)
FROM
    t1 AS t1
FULL JOIN tn2 AS t2
    USING (key)
ORDER BY
    key ASC,
    length(t1.s) ASC,
    length(t2.s) ASC;

SET join_algorithm = 'full_sorting_merge';

SET join_use_nulls = 1;