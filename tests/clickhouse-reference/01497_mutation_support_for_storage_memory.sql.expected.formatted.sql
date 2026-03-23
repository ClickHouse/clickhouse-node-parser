CREATE TABLE defaults
(
    n Int32,
    s String
)
ENGINE = Memory();

INSERT INTO defaults;

SELECT *
FROM defaults;

SELECT count(*)
FROM defaults;