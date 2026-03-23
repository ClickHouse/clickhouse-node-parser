DROP TABLE IF EXISTS tmp;

SET mutations_sync = 2;

CREATE TABLE tmp
(
    x Int64
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY tuple();

INSERT INTO tmp SELECT *
FROM `system`.numbers
LIMIT 20;

SELECT
    arraySort(groupArray(x)),
    arraySort(groupArray(s))
FROM tmp;

DROP TABLE tmp;