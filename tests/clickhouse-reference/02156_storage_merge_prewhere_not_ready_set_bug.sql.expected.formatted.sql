SELECT
    sum(x),
    min(x + x),
    max(x + x)
FROM merge(currentDatabase(), '^merge_kek_.$')
WHERE x > 200
    AND y IN (
        SELECT 500 + number * 2
        FROM numbers(100)
    )
SETTINGS max_threads = 2;