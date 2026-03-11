SELECT arrayJoin(arrayMap(i -> (i + 1), range(2))) AS index, number
FROM numbers(2)
GROUP BY number
ORDER BY index, number;
SELECT count() FROM
(
    SELECT
        arrayJoin(arrayMap(i -> (i + 1), range(2))) AS index,
        number
    FROM numbers_mt(100000)
    GROUP BY number
    ORDER BY index ASC
    SETTINGS max_block_size = 100000, max_threads = 2
);
