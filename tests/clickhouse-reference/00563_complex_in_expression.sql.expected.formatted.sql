SELECT *
FROM test_00563
WHERE toInt32(site_id) IN (100);

SELECT *
FROM test_00563
WHERE toInt32(site_id) IN (100, 101);

SELECT key + 1
FROM
    join_with_index
INNER JOIN (
        SELECT
            key,
            data
        FROM join_with_index
        WHERE toUInt64(data) IN (0, 529335254087962442)
    ) AS js2
    USING (key);

SELECT
    _uniq,
    _uniq IN (0, 99)
FROM
    join_with_index
ARRAY JOIN [key, data] AS _uniq
ORDER BY _uniq ASC;