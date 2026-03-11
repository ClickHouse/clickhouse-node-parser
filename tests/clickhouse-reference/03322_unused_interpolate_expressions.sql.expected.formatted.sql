SELECT group_id
FROM (
        SELECT
            intDiv(open_time, 10) AS group_id,
            toFloat64(argMin(open_price, open_time)) AS open,
            toFloat64(argMax(close_price, open_time)) AS close
        FROM foo
        GROUP BY group_id
        ORDER BY group_id ASC WITH FILL STEP 1 INTERPOLATE (open, close)
    );

SELECT
    group_id,
    open
FROM (
        SELECT
            intDiv(open_time, 10) AS group_id,
            toFloat64(argMin(open_price, open_time)) AS open,
            toFloat64(argMax(close_price, open_time)) AS close
        FROM foo
        GROUP BY group_id
        ORDER BY group_id ASC WITH FILL STEP 1 INTERPOLATE (open, close)
    );

SELECT
    group_id,
    open,
    close
FROM (
        SELECT
            intDiv(open_time, 10) AS group_id,
            toFloat64(argMin(open_price, open_time)) AS open,
            toFloat64(argMax(close_price, open_time)) AS close
        FROM foo
        GROUP BY group_id
        ORDER BY group_id ASC WITH FILL STEP 1 INTERPOLATE (open, close)
    );