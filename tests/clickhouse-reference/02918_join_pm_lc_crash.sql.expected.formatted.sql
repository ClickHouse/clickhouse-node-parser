SELECT *
FROM
    (
        SELECT dummy AS val
        FROM `system`.one
    )
INNER JOIN (
        SELECT toLowCardinality(toNullable(dummy)) AS val
        FROM `system`.one
        GROUP BY val
        WITH TOTALS
    )
    USING (val);