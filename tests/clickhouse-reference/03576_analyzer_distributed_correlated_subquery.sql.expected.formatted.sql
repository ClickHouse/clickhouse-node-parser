SELECT (
        SELECT _shard_num
    )
FROM t1
GROUP BY _shard_num
SETTINGS allow_experimental_correlated_subqueries = 1; -- { serverError NOT_IMPLEMENTED }