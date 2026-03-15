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

SET mutations_sync = 2;