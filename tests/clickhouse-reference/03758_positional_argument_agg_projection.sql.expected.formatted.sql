CREATE TABLE test
(
    a UInt64,
    b String
)
ENGINE = MergeTree
ORDER BY a;

SET enable_positional_arguments_for_projections = 0;

SET enable_positional_arguments_for_projections = 1;