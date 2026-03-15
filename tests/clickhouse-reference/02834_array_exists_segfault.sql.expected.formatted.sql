CREATE TABLE `02834_t`
(
    id UInt64,
    arr Array(UInt64)
)
ENGINE = MergeTree
ORDER BY id;

SET enable_analyzer = 0;

SET enable_analyzer = 1;