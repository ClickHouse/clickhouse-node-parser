-- Tags: no-random-settings, no-asan, no-msan, no-tsan, no-ubsan, no-debug
SET max_rows_to_read = '100M';

SELECT count()
FROM (
        SELECT
            toInt128(number) * number AS x,
            toInt256(number) * number AS y
        FROM numbers_mt(100000000)
        WHERE x != y
    );