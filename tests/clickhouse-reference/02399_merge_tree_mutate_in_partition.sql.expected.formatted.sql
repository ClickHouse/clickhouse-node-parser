SYSTEM drop  table if exists mt;

SYSTEM drop  table if exists m;

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

SYSTEM drop  table m;

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

SYSTEM drop  table mt;