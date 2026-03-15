CREATE TABLE t_async_insert_params
(
    id UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

SET param_p1 = 'Hello';

SET async_insert = 1;

SET wait_for_async_insert = 1;

SELECT *
FROM t_async_insert_params
ORDER BY id ASC;