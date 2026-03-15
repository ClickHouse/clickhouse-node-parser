CREATE TABLE test
(
    qbit QBit(Float64, 3)
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT *
FROM test
ORDER BY qbit ASC; -- {serverError ILLEGAL_COLUMN}

SELECT qbit < qbit
FROM test; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}