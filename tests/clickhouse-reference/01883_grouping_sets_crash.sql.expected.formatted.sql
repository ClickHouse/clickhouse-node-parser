SELECT
    fact_3_id,
    fact_4_id
FROM grouping_sets
GROUP BY GROUPING SETS (('wo\0ldworldwo\0ldworld'), (fact_3_id, fact_4_id))
ORDER BY
    fact_3_id ASC,
    fact_4_id ASC;

SELECT
    fact_3_id,
    fact_4_id
FROM grouping_sets
GROUP BY GROUPING SETS ((fact_1_id, fact_2_id), ((-9223372036854775808, NULL, (tuple(1.), (tuple(1.), 1048576), 65535))), ((tuple(3.4028234663852886e38), (tuple(1024), -2147483647), NULL)), (fact_3_id, fact_4_id))
ORDER BY
    (NULL, ('256', (tuple(NULL), NULL), NULL, NULL), NULL) ASC,
    fact_1_id DESC,
    fact_2_id DESC,
    fact_4_id ASC;

SELECT
    extractAllGroups(NULL, 'worldworldworldwo\0ldworldworldworldwo\0ld'),
    fact_2_id,
    fact_3_id,
    fact_4_id
FROM grouping_sets
GROUP BY GROUPING SETS ((sales_value), (fact_1_id, fact_2_id), ('wo\0ldworldwo\0ldworld'), (fact_3_id, fact_4_id))
ORDER BY
    fact_1_id DESC,
    fact_1_id DESC,
    fact_2_id ASC,
    fact_3_id DESC,
    fact_4_id ASC;

SELECT fact_3_id
FROM grouping_sets
GROUP BY GROUPING SETS ((fact_3_id, fact_4_id))
ORDER BY fact_3_id ASC;

SELECT 'w\0\0ldworldwo\0l\0world'
FROM grouping_sets
GROUP BY GROUPING SETS ((fact_4_id), (NULL), (fact_3_id, fact_4_id))
ORDER BY
    NULL ASC,
    NULL DESC,
    fact_3_id ASC,
    fact_3_id ASC,
    'wo\0ldworldwo\0ldworld' ASC,
    'w\0\0ldworldwo\0l\0world' DESC,
    'wo\0ldworldwo\0ldworld' ASC,
    NULL ASC,
    fact_4_id DESC;

SELECT fact_3_id
FROM grouping_sets
GROUP BY GROUPING SETS (('wo\0ldworldwo\0ldworldwo\0ldworldwo\0ldworldwo\0ldworldwo\0ldworldwo\0ldworldwo\0ldworld'), (NULL), (fact_4_id), (fact_3_id, fact_4_id))
ORDER BY fact_3_id ASC;

SELECT
    fact_3_id,
    fact_4_id,
    count()
FROM grouping_sets
GROUP BY GROUPING SETS ((fact_3_id, fact_4_id))
ORDER BY
    fact_3_id ASC,
    fact_4_id ASC
SETTINGS optimize_aggregation_in_order = 1;

SELECT
    fact_3_id,
    fact_4_id,
    count()
FROM grouping_sets
GROUP BY GROUPING SETS ((fact_3_id), (fact_4_id))
ORDER BY
    fact_3_id ASC,
    fact_4_id ASC
SETTINGS optimize_aggregation_in_order = 1;

SELECT
    fact_3_id,
    fact_4_id,
    count()
FROM grouping_sets
GROUP BY GROUPING SETS ((fact_3_id), (fact_3_id, fact_4_id))
ORDER BY
    fact_3_id ASC,
    fact_4_id ASC
SETTINGS optimize_aggregation_in_order = 1;