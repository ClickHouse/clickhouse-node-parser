CREATE TABLE base_table
(
    date DateTime,
    id String,
    cost Float64
)
ENGINE = MergeTree()
ORDER BY date;

CREATE TABLE target_table
(
    id String,
    total AggregateFunction(sum, Float64)
)
ENGINE = MergeTree()
ORDER BY id;

CREATE MATERIALIZED VIEW mv_from_base_to_target
TO target_table
AS
SELECT
    id,
    sumState(cost) AS total
FROM base_table
GROUP BY id;

CREATE MATERIALIZED VIEW mv_with_storage
ENGINE = MergeTree()
ORDER BY id
AS
SELECT
    id,
    sumState(cost)
FROM base_table
GROUP BY id;

CREATE TABLE other_table_1 AS mv_with_storage;

CREATE TABLE other_table_2 AS mv_from_base_to_target; -- { serverError INCORRECT_QUERY }