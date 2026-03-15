CREATE TABLE tmp_01375
(
    n UInt32,
    s String
)
ENGINE = Memory;

CREATE TABLE table_tsv_01375 AS tmp_01375
ENGINE = File(TSVWithNames);

SELECT *
FROM table_tsv_01375;