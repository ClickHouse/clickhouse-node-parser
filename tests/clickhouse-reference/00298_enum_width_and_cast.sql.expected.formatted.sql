SELECT *
FROM enum
ORDER BY
    x ASC,
    y ASC
FORMAT PrettyCompactMonoBlock;

SELECT
    x,
    y,
    toInt8(x),
    toString(x) AS s,
    CAST(s AS Enum8('Hello' = -100, '\\' = 0, '\t\\t' = 111)) AS cast
FROM enum
ORDER BY
    x ASC,
    y ASC
FORMAT PrettyCompactMonoBlock;