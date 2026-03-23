CREATE TABLE mt_01451
(
    v UInt8
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS old_parts_lifetime = 0;

INSERT INTO mt_01451;

INSERT INTO mt_01451;

INSERT INTO mt_01451;

SELECT v
FROM mt_01451
ORDER BY v ASC;

SELECT name
FROM `system`.detached_parts
WHERE table = 'mt_01451'
    AND database = currentDatabase();

SELECT '-- drop part --';

SELECT name
FROM `system`.parts
WHERE table = 'mt_01451'
    AND active
    AND database = currentDatabase();