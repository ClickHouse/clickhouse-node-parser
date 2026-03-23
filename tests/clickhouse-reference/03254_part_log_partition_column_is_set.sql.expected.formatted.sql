DROP TABLE IF EXISTS test;

CREATE TABLE test
(
    x UInt8,
    y UInt8,
    z String DEFAULT toString(x)
)
ORDER BY x
PARTITION BY x;

INSERT INTO test (x, y);

INSERT INTO test (x, y);

INSERT INTO test (x, y);

ALTER TABLE test DROP PARTITION 2;

SET mutations_sync = 1;

ALTER TABLE test UPDATE z = concat(x, y) WHERE 1;

SELECT *
FROM test
ORDER BY `ALL` ASC;

DROP TABLE test;

-- SELECT * FROM system.part_log WHERE database = currentDatabase() FORMAT Vertical;
SELECT DISTINCT throwIf(empty(`partition`))
FROM `system`.part_log
WHERE database = currentDatabase();