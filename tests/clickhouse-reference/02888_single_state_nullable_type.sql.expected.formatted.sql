WITH minSimpleState(value) AS c

SELECT
    toTypeName(c),
    c
FROM (
        SELECT NULL AS value
        UNION ALL
        SELECT 1 AS value
    );