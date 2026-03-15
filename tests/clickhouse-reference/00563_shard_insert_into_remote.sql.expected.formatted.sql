CREATE TABLE tab
(
    val UInt8
)
ENGINE = MergeTree
ORDER BY val;

SELECT *
FROM tab
ORDER BY val ASC;