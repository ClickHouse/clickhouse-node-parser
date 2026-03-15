-- { echoOn }
SET allow_experimental_nullable_tuple_type = 0;

CREATE TABLE test_table
(
    a Nullable(Tuple(b Int32, c Int32))
)
ENGINE = Memory; -- { serverError ILLEGAL_COLUMN }

SET allow_experimental_nullable_tuple_type = 1;

SELECT *
FROM test_table;