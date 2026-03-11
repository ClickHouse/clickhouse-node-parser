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

SELECT *
FROM
    (
        SELECT toUInt32(11) AS id2
    ) AS js1
LEFT JOIN joinbug_join
    USING (id2);

SELECT *
FROM
    (
        SELECT toInt64(11) AS id2
    ) AS js1
LEFT JOIN joinbug_join
    USING (id2);