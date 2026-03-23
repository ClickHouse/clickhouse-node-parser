CREATE TABLE defaults_all_columns
(
    n UInt8 DEFAULT 42,
    s String DEFAULT concat('test', CAST(n, 'String'))
)
ENGINE = Memory;

INSERT INTO defaults_all_columns;

INSERT INTO defaults_all_columns;

SELECT *
FROM defaults_all_columns
ORDER BY
    n ASC,
    s ASC;