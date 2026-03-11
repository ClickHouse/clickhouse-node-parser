SELECT b.id
FROM
    (
        SELECT toLowCardinality(0::UInt32) AS id
        GROUP BY []
    ) AS a
LEFT JOIN (
        SELECT toLowCardinality(1::UInt64) AS id
    ) AS b
    USING (id);