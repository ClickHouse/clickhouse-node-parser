SELECT *
FROM sum_map
ORDER BY
    timeslot ASC,
    statusMap.status ASC,
    statusMap.requests ASC;

SELECT sumMap(statusMap.status, statusMap.requests)
FROM sum_map;

SELECT sumMap((statusMap.status, statusMap.requests))
FROM sum_map;

SELECT sumMapMerge(s)
FROM (
        SELECT sumMapState(statusMap.status, statusMap.requests) AS s
        FROM sum_map
    );

SELECT
    timeslot,
    sumMap(statusMap.status, statusMap.requests)
FROM sum_map
GROUP BY timeslot
ORDER BY timeslot ASC;

SELECT
    timeslot,
    sumMap(statusMap.status, statusMap.requests).1,
    sumMap(statusMap.status, statusMap.requests).2
FROM sum_map
GROUP BY timeslot
ORDER BY timeslot ASC;

SELECT sumMapFiltered([1])(statusMap.status, statusMap.requests)
FROM sum_map;

SELECT sumMapFiltered([1, 4, 8])(statusMap.status, statusMap.requests)
FROM sum_map;

SELECT sumMap(events, counts)
FROM sum_map_overflow;

SELECT sumMapWithOverflow(events, counts)
FROM sum_map_overflow;

SELECT sumMap(val, cnt)
FROM (
        SELECT
            [ CAST(1, 'UInt64') ] AS val,
            [1] AS cnt
    );

SELECT sumMap(val, cnt)
FROM (
        SELECT
            [ CAST(1, 'Float64') ] AS val,
            [1] AS cnt
    );

SELECT sumMap(val, cnt)
FROM (
        SELECT
            [ CAST('a', 'Enum16(\'a\'=1)') ] AS val,
            [1] AS cnt
    );

SELECT sumMap(val, cnt)
FROM (
        SELECT
            [ CAST(1, 'DateTime(\'Asia/Istanbul\')') ] AS val,
            [1] AS cnt
    );

SELECT sumMap(val, cnt)
FROM (
        SELECT
            [ CAST(1, 'Date') ] AS val,
            [1] AS cnt
    );

SELECT sumMap(val, cnt)
FROM (
        SELECT
            [ CAST('01234567-89ab-cdef-0123-456789abcdef', 'UUID') ] AS val,
            [1] AS cnt
    );

SELECT sumMap(val, cnt)
FROM (
        SELECT
            [ CAST(1.01, 'Decimal(10,2)') ] AS val,
            [1] AS cnt
    );

SELECT sumMap(val, cnt)
FROM (
        SELECT
            [ CAST('a', 'FixedString(1)'), CAST('b', 'FixedString(1)' ) ] AS val,
            [1, 2] AS cnt
    );

SELECT sumMap(val, cnt)
FROM (
        SELECT
            [ CAST('abc', 'String'), CAST('ab', 'String'), CAST('a', 'String') ] AS val,
            [1, 2, 3] AS cnt
    );

SELECT sumMap(statusMap.goal_id, statusMap.revenue)
FROM sum_map_decimal;

SELECT sumMapWithOverflow(statusMap.goal_id, statusMap.revenue)
FROM sum_map_decimal;

SELECT sumMap(statusMap.goal_id, statusMap.revenue)
FROM sum_map_decimal_nullable;