-- { echoOff }
SELECT count()
FROM (
        SELECT throwIf(count() != 2)
        FROM t1
        GROUP BY a
    );

-- { echoOff }
SELECT count()
FROM (
        SELECT throwIf(count() != 2)
        FROM t2
        GROUP BY a
    );

-- { echoOff }
SELECT count()
FROM (
        SELECT throwIf(count() != 2)
        FROM t3
        GROUP BY a
    );

SELECT throwIf(count() != 4)
FROM remote('127.0.0.{1,2}', currentDatabase(), t3)
GROUP BY a
FORMAT Null;

-- if we happened to switch to external aggregation at some point, merging will happen as usual
SELECT count()
FROM (
        SELECT throwIf(count() != 2)
        FROM t3
        GROUP BY a
    )
SETTINGS
    max_bytes_before_external_group_by = '1Ki',
    max_bytes_ratio_before_external_group_by = 0;

-- { echoOff }
SELECT count()
FROM (
        SELECT throwIf(count() != 2)
        FROM t4
        GROUP BY a
    );

-- { echoOff }
SELECT count()
FROM (
        SELECT throwIf(count() != 2)
        FROM t5
        GROUP BY a
    );

-- { echoOff }
SELECT count()
FROM (
        SELECT throwIf(count() != 2)
        FROM t6
        GROUP BY a
    );

SELECT replaceRegexpOne(`explain`, '^[ ]*(.*)', '\\1')
FROM (
        EXPLAIN actions = 1
        SELECT intDiv(a, 2) AS a1
        FROM t7
        GROUP BY a1
    )
WHERE like(`explain`, '%Skip merging: %');

SELECT replaceRegexpOne(`explain`, '^[ ]*(.*)', '\\1')
FROM (
        EXPLAIN actions = 1
        SELECT intDiv(a, 2) + 1 AS a1
        FROM t8
        GROUP BY a1
    )
WHERE like(`explain`, '%Skip merging: %');

SELECT replaceRegexpOne(`explain`, '^[ ]*(.*)', '\\1')
FROM (
        EXPLAIN actions = 1
        SELECT intDiv(a, 3) AS a1
        FROM t9
        GROUP BY a1
    )
WHERE like(`explain`, '%Skip merging: %');

SELECT replaceRegexpOne(`explain`, '^[ ]*(.*)', '\\1')
FROM (
        EXPLAIN actions = 1
        SELECT
            intDiv(a, 2) + 1 AS a1,
            intDiv(b, 3) AS b1
        FROM t10
        GROUP BY
            a1,
            b1,
            pi()
    )
WHERE like(`explain`, '%Skip merging: %');

SELECT replaceRegexpOne(`explain`, '^[ ]*(.*)', '\\1')
FROM (
        EXPLAIN actions = 1
        SELECT
            intDiv(a, 2) + 1 AS a1,
            intDiv(b, 3) * 2 AS b1
        FROM t11
        GROUP BY
            a1,
            b1,
            pi()
    )
WHERE like(`explain`, '%Skip merging: %');

SELECT replaceRegexpOne(`explain`, '^[ ]*(.*)', '\\1')
FROM (
        EXPLAIN actions = 1
        SELECT
            a,
            b
        FROM t12
        GROUP BY
            a,
            b,
            pi()
    )
WHERE like(`explain`, '%Skip merging: %');

SELECT replaceRegexpOne(`explain`, '^[ ]*(.*)', '\\1')
FROM (
        EXPLAIN actions = 1
        SELECT s
        FROM t13
        GROUP BY
            intDiv(a, 2) + intDiv(b, 3) AS s,
            pi()
    )
WHERE like(`explain`, '%Skip merging: %');

SELECT replaceRegexpOne(`explain`, '^[ ]*(.*)', '\\1')
FROM (
        EXPLAIN actions = 1
        SELECT
            intDiv(a, 2) AS a1,
            intDiv(b, 3) AS b1
        FROM t14
        GROUP BY
            a1,
            b1,
            pi()
    )
WHERE like(`explain`, '%Skip merging: %');

SELECT replaceRegexpOne(`explain`, '^[ ]*(.*)', '\\1')
FROM (
        EXPLAIN actions = 1
        SELECT a
        FROM t15
        GROUP BY a
    )
WHERE like(`explain`, '%Skip merging: %')
SETTINGS force_aggregate_partitions_independently = 0;

SELECT replaceRegexpOne(`explain`, '^[ ]*(.*)', '\\1')
FROM (
        EXPLAIN actions = 1
        SELECT a
        FROM t16
        GROUP BY a
    )
WHERE like(`explain`, '%Skip merging: %')
SETTINGS
    force_aggregate_partitions_independently = 0,
    max_number_of_partitions_for_independent_aggregation = 4;

SELECT replaceRegexpOne(`explain`, '^[ ]*(.*)', '\\1')
FROM (
        EXPLAIN actions = 1
        SELECT a
        FROM t17
        GROUP BY a
    )
WHERE like(`explain`, '%Skip merging: %')
SETTINGS
    force_aggregate_partitions_independently = 0,
    max_threads = 4;

SELECT replaceRegexpOne(`explain`, '^[ ]*(.*)', '\\1')
FROM (
        EXPLAIN actions = 1
        SELECT a1
        FROM t18
        GROUP BY intDiv(a, 2) AS a1
    )
WHERE like(`explain`, '%Skip merging: %');

SELECT replaceRegexpOne(`explain`, '^[ ]*(.*)', '\\1')
FROM (
        EXPLAIN actions = 1
        SELECT a1
        FROM t19
        GROUP BY blockNumber() AS a1
    )
WHERE like(`explain`, '%Skip merging: %');

SELECT replaceRegexpOne(`explain`, '^[ ]*(.*)', '\\1')
FROM (
        EXPLAIN actions = 1
        SELECT a1
        FROM t20
        GROUP BY rand(a) AS a1
    )
WHERE like(`explain`, '%Skip merging: %');

SELECT a
FROM t21
GROUP BY a
LIMIT 10
FORMAT Null;

SELECT replaceRegexpOne(`explain`, '^[ ]*(.*)', '\\1')
FROM (
        EXPLAIN actions = 1
        SELECT a
        FROM t22 FINAL
        GROUP BY a
    )
WHERE like(`explain`, '%Skip merging: %');