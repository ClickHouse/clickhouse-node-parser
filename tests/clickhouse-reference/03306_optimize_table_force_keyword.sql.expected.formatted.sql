CREATE TABLE tab
(
    x UInt32
)
ENGINE = MergeTree
ORDER BY x;

INSERT INTO tab;

INSERT INTO tab;

SELECT count(*)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'tab'
    AND active = 1;