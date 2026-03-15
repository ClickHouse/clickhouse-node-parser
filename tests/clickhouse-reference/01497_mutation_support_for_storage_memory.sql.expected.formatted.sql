CREATE TABLE defaults
(
    n Int32,
    s String
)
ENGINE = Memory();

SELECT *
FROM defaults;

SELECT count(*)
FROM defaults;