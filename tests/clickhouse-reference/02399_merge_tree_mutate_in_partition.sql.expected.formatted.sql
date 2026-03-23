DROP TABLE IF EXISTS mt;

DROP TABLE IF EXISTS m;

CREATE TABLE mt
(
    p int,
    n int
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY p;

CREATE TABLE m
(
    n int
)
ENGINE = Memory;

INSERT INTO mt;

INSERT INTO mt;

SELECT
    *,
    _part
FROM mt
ORDER BY _part ASC;

DROP TABLE m;

SELECT
    mutation_id,
    command,
    parts_to_do_names,
    parts_to_do,
    is_done
FROM `system`.mutations
WHERE database = currentDatabase();

SELECT *
FROM mt
ORDER BY
    p ASC,
    n ASC;

DROP TABLE mt;