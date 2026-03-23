SYSTEM DROP  TABLE IF EXISTS bad_conversions;

SYSTEM DROP  TABLE IF EXISTS bad_conversions_2;

CREATE TABLE bad_conversions
(
    a UInt32
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO bad_conversions;

SELECT count()
FROM `system`.mutations
WHERE table = 'bad_conversions'
    AND database = currentDatabase();

CREATE TABLE bad_conversions_2
(
    e Enum('foo' = 1, 'bar' = 2)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO bad_conversions_2;

SELECT count()
FROM `system`.mutations
WHERE table = 'bad_conversions_2'
    AND database = currentDatabase();