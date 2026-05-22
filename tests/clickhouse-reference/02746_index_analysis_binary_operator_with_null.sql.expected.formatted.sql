DROP TABLE IF EXISTS tab;

CREATE TABLE tab
(
    x DateTime
)
ENGINE = MergeTree
ORDER BY x;

SELECT toDateTime(65537, toDateTime(NULL), NULL)
FROM tab
WHERE ((x + CAST('1', 'Nullable(UInt8)')) <= 2)
    AND ((x + CAST('', 'Nullable(UInt8)')) <= 256)
ORDER BY
    toDateTime(toDateTime(-2, NULL, NULL) + 100.0001, NULL, -2, NULL) DESC,
    x ASC;

DROP TABLE tab;