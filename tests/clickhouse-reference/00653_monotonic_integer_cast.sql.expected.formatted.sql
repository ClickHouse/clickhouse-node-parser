CREATE TABLE table_00653
(
    val Int32
)
ENGINE = MergeTree
ORDER BY val;

SELECT count()
FROM table_00653
WHERE toUInt64(val) == 0;