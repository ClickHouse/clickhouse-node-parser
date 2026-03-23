SYSTEM drop  table if exists prewhere_alias;

CREATE TABLE prewhere_alias
(
    a Int32,
    b Int32,
    c ALIAS a + b
)
ENGINE = MergeTree
ORDER BY b;

INSERT INTO prewhere_alias;

SELECT
    a,
    c + toInt32(1),
    ((c + toInt32(1))) * 2
FROM prewhere_alias
PREWHERE ((c + toInt32(1))) * 2 = 6;

SYSTEM drop  table prewhere_alias;