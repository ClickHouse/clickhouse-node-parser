SELECT startsWith(trimLeft(`explain`), 'Resize') AS resize
FROM (
        EXPLAIN PIPELINE
        SELECT *
        FROM file(data_02723.csv)
    )
WHERE resize;

SELECT match(arrayStringConcat(groupArray(`explain`), ''), '.*Resize 1 → 2 *URL 0 → 1 *$')
FROM (
        EXPLAIN PIPELINE
        SELECT
            x,
            count()
        FROM url('https://example.com', Parquet, 'x Int64')
        GROUP BY x
        ORDER BY count() ASC
        LIMIT 10
    );