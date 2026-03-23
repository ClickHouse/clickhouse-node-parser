-- Tags: memory-engine
DROP TABLE IF EXISTS defaults;

CREATE TABLE defaults
(
    n Int32,
    s String
)
ENGINE = Memory();

INSERT INTO defaults;

SELECT *
FROM defaults;

ALTER TABLE defaults UPDATE n = 100 WHERE s = '1';

SELECT count(*)
FROM defaults;

ALTER TABLE defaults DELETE WHERE n = 100;

DROP TABLE defaults;