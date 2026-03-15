CREATE TABLE test_tbl
(
    vend_nm String,
    ship_dt Date
)
ENGINE = MergeTree
ORDER BY vend_nm
PARTITION BY toWeek(ship_dt);

SELECT *
FROM test_tbl
WHERE ship_dt >= toDate('2020-11-01')
    AND ship_dt <= toDate('2021-05-05')
ORDER BY ship_dt ASC;

SELECT *
FROM test_tbl
WHERE ship_dt >= toDate('2020-01-01')
    AND ship_dt <= toDate('2021-05-05')
ORDER BY ship_dt ASC;