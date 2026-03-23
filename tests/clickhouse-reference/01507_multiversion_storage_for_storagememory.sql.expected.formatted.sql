SYSTEM DROP  TABLE IF EXISTS defaults;

CREATE TABLE defaults
(
    n Int32
)
ENGINE = Memory();

INSERT INTO defaults SELECT *
FROM numbers(10);

SELECT *
FROM defaults;

SYSTEM DROP  TABLE defaults;