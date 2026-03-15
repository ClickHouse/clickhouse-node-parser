CREATE TABLE prewhere_alias
(
    a Int32,
    b Int32,
    c ALIAS a + b
)
ENGINE = MergeTree
ORDER BY b;

SELECT
    a,
    c + toInt32(1),
    ((c + toInt32(1))) * 2
FROM prewhere_alias
PREWHERE ((c + toInt32(1))) * 2 = 6;