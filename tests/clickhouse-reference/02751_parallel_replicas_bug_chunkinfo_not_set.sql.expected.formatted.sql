SELECT
    key,
    value1,
    value2,
    toUInt64(min(time)) AS start_ts
FROM join_inner_table__fuzz_1
PREWHERE (id = '833c9e22-c245-4eb5-8745-117a9a1f26b1')
    AND (number > toUInt64('1610517366120'))
GROUP BY
    key,
    value1,
    value2
WITH ROLLUP
ORDER BY
    key ASC,
    value1 ASC,
    value2 ASC
LIMIT 10
FORMAT Null;