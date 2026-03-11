SELECT
    if(max(size) < 5000000
    AND argMax(`rows`, size) < 10000, 'Ok', format('Error: max_size={} rows={}', max(size), argMax(`rows`, size))),
    if(max(`rows`) >= 50000, 'Ok', format('Error: {}', toString(max(`rows`))))
FROM (
        SELECT
            blockNumber() AS bn,
            sum(byteSize(*)) AS size,
            count() AS `rows`
        FROM
            t1
        INNER JOIN t2
            ON t1.key = t2.key
        GROUP BY bn
    )
SETTINGS
    joined_block_split_single_row = 1,
    max_joined_block_size_bytes = '4M',
    max_joined_block_size_rows = 65000;

SELECT if(argMax(`rows`, size) = 1
    AND max(size) < 10000000, 'Ok', format('Error: max_size={} rows={}', max(size), argMax(`rows`, size)))
FROM (
        SELECT
            blockNumber() AS bn,
            sum(byteSize(*)) AS size,
            count() AS `rows`
        FROM
            t1
        INNER JOIN t2
            ON t1.key = t2.key
        GROUP BY bn
    )
SETTINGS
    joined_block_split_single_row = 1,
    max_joined_block_size_bytes = '4M';