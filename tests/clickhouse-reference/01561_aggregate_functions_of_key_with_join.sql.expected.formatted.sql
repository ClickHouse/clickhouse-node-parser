SELECT
    source.key,
    max(target.key)
FROM
    (
        SELECT
            1 AS key,
            'x' AS name
    ) AS source
INNER JOIN (
        SELECT
            2 AS key,
            'x' AS name
    ) AS target
    ON source.name = target.name
GROUP BY source.key;