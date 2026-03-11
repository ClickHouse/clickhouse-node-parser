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