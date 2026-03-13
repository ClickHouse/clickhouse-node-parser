SELECT *
FROM joinbug;

SELECT
    id,
    id2,
    val,
    val2,
    created
FROM
    (
        SELECT toUInt64(arrayJoin(range(50))) AS id2
    ) AS js1
LEFT JOIN joinbug_join
    USING (id2);

-- type conversion
SELECT *
FROM
    (
        SELECT toUInt32(11) AS id2
    ) AS js1
LEFT JOIN joinbug_join
    USING (id2);

-- can't convert right side in case on storage join
SELECT *
FROM
    (
        SELECT toInt64(11) AS id2
    ) AS js1
LEFT JOIN joinbug_join
    USING (id2); -- { serverError TYPE_MISMATCH, 386 }