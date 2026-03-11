-- segmentation fault (filter on dt_close column)
SELECT
    dt_close,
    close
FROM fx_5m
where symbol = 'EURUSD' and dt_close between '2022-12-11' and '2022-12-13'
order by dt_close
format Null;
