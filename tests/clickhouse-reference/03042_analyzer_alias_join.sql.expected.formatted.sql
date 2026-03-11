SELECT NULL AS t2value
FROM
    test1 AS t1
LEFT JOIN (
        SELECT
            id,
            t2value
        FROM test2
    ) AS t2
    ON t1.id = t2.id
WHERE t2.t2value = 'test';

SELECT NULL AS _svalue
FROM
    test1 AS t1
LEFT JOIN (
        SELECT
            id,
            t2value
        FROM test2
    ) AS t2
    ON t1.id = t2.id
WHERE t2.t2value = 'test';