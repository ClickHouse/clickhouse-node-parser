SELECT
    number AS k,
    repeat(toString(number), 11) AS v1,
    repeat(toString(number), 12) AS v2
FROM numbers(3e6)
ORDER BY
    v1 ASC,
    v2 ASC
LIMIT 400e3
FORMAT Null;

SELECT
    number AS k,
    repeat(toString(number), 11) AS v1,
    repeat(toString(number), 12) AS v2
FROM numbers(3e6)
ORDER BY
    v1 ASC,
    v2 ASC
LIMIT 400e3
SETTINGS remerge_sort_lowered_memory_bytes_ratio = 2.
FORMAT Null;

SELECT
    number AS k,
    repeat(toString(number), 11) AS v1,
    repeat(toString(number), 12) AS v2
FROM numbers(3e6)
ORDER BY k ASC
LIMIT 400e3
SETTINGS remerge_sort_lowered_memory_bytes_ratio = 1.9
FORMAT Null;