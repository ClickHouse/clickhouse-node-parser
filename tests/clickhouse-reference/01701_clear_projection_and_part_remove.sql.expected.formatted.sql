SYSTEM drop  table if exists tp_1;

-- In this test, we are going to create an old part with written projection which does not exist in table metadata
CREATE TABLE tp_1
(
    x Int32,
    y Int32,
    PROJECTION p (    SELECT
        x,
        y
    ORDER BY x ASC)
)
ENGINE = MergeTree
ORDER BY y
PARTITION BY intDiv(y, 100)
SETTINGS old_parts_lifetime = 1;

INSERT INTO tp_1 SELECT
    number,
    number
FROM numbers(3);

SET mutations_sync = 2;

INSERT INTO tp_1 SELECT
    number,
    number
FROM numbers(4);

-- Now, DROP TABLE triggers part removal
SYSTEM drop  table tp_1;