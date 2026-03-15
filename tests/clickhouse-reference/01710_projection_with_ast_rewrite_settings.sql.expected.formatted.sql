CREATE TABLE aggregate_functions_null_for_empty
(
    x UInt32,
    y UInt64,
    PROJECTION p (    SELECT sum(y))
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT count()
FROM aggregate_functions_null_for_empty;

CREATE TABLE transform_null_in
(
    x UInt32,
    y UInt64,
    PROJECTION p (    SELECT sum(y IN (1, 2, 3)))
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT count()
FROM transform_null_in;

CREATE TABLE legacy_column_name_of_tuple_literal
(
    x UInt32,
    y UInt64,
    PROJECTION p (    SELECT sum(y IN (1, 2, 3)))
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT count()
FROM legacy_column_name_of_tuple_literal;