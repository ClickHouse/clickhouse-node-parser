CREATE TABLE h3_indexes
(
    h3_index UInt64
)
ENGINE = Memory;

-- Test h3 indices selected from original test fixture: https://github.com/uber/h3/blob/master/src/apps/testapps/testH3CellAreaExhaustive.c
INSERT INTO h3_indexes;

INSERT INTO h3_indexes;

INSERT INTO h3_indexes;

INSERT INTO h3_indexes;

INSERT INTO h3_indexes;

INSERT INTO h3_indexes;

INSERT INTO h3_indexes;

INSERT INTO h3_indexes;

INSERT INTO h3_indexes;

INSERT INTO h3_indexes;

INSERT INTO h3_indexes;

INSERT INTO h3_indexes;

INSERT INTO h3_indexes;

INSERT INTO h3_indexes;

INSERT INTO h3_indexes;

INSERT INTO h3_indexes;

SELECT round(h3ExactEdgeLengthRads(h3_index), 5)
FROM h3_indexes
ORDER BY h3_index ASC;