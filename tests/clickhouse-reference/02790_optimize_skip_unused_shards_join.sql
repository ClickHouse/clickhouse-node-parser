SELECT
    sum(if(inner_distributed.id != 0, 1, 0)) AS total,
    inner_distributed.date AS date
FROM outer_distributed AS outer_distributed
FINAL
LEFT JOIN
(
    SELECT
        inner_distributed.outer_id AS outer_id,
        inner_distributed.id AS id,
        inner_distributed.date AS date
    FROM inner_distributed AS inner_distributed
    FINAL
    WHERE inner_distributed.organization_id = 15078
) AS inner_distributed ON inner_distributed.outer_id = outer_distributed.id
WHERE (outer_distributed.organization_id = 15078) AND (date != toDate('1970-01-01'))
GROUP BY date
ORDER BY date DESC
SETTINGS distributed_product_mode = 'local', optimize_skip_unused_shards = 1;
