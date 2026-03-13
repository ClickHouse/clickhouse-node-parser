-- segmentation fault (filter on dt_close column)
SELECT
    dt_close,
    close
FROM fx_5m
WHERE symbol = 'EURUSD'
    AND and(greaterOrEquals(dt_close, '2022-12-11'), lessOrEquals(dt_close, '2022-12-13'))
ORDER BY dt_close ASC
FORMAT Null;