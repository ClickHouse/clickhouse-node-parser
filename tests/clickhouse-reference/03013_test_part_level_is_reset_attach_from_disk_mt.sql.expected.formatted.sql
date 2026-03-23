-- Tags: no-shared-merge-tree
SET alter_sync = 2;

-- {echoOn}
DROP TABLE IF EXISTS test;

CREATE TABLE test
(
    a Int
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO test;

SELECT part_name
FROM `system`.parts
WHERE table = 'test'
    AND active
    AND database = currentDatabase();