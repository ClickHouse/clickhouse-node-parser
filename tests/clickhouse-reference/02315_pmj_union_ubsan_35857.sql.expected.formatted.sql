SELECT NULL
FROM
    (
        SELECT
            NULL,
            1 AS a,
            0::Nullable(UInt8) AS c
        UNION ALL
        SELECT
            NULL,
            65536,
            NULL
    ) AS js1
LEFT JOIN (
        SELECT 2::Nullable(UInt8) AS a
    ) AS js2
    USING (a)
ORDER BY c ASC;