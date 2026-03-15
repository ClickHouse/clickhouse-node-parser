CREATE TABLE tuple
(
    `j` Tuple(a Int8, b String)
)
ENGINE = Memory;
CREATE TABLE tuple ENGINE = Memory AS SELECT CAST((1, 'Test'), 'Tuple(a Int8,  b String)') AS j;
