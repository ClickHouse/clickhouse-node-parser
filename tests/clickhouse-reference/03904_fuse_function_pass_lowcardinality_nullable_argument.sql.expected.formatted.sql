-- { echo }
SET optimize_syntax_fuse_functions = 1;

SET allow_suspicious_low_cardinality_types = 1;

CREATE TABLE test
(
    a Float64,
    b LowCardinality(Nullable(Int8))
)
ENGINE = Log;

SELECT count(b) * count(b)
FROM (
        SELECT b
        FROM test
    );

SELECT
    avg(b) * 3,
    (sum(b) + 1) + count(b),
    count(b) * count(b),
    count()
FROM (
        SELECT b
        FROM test
    );

SELECT
    sum(b),
    count(b),
    sum(a),
    count(a)
FROM (
        SELECT
            a,
            b
        FROM test
    );

SELECT
    sum(a),
    count(a)
FROM (
        SELECT CAST(materialize(1), 'LowCardinality(Nullable(Int32))') AS a
    ) AS t;

SET enable_analyzer = 1;