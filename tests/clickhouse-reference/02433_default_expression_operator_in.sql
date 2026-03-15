CREATE TABLE id_join (`country` String, `location` Array(Int32)) ENGINE = Join(ANY, LEFT, country);
CREATE TABLE dep
(
    `id` Int32,
    `country` LowCardinality(String),
    `purchase_location` UInt16 MATERIALIZED if(id IN joinGet(concat(currentDatabase(), '.id_join'), 'location', 'CLICK'), 123, 456)
)
ENGINE = ReplicatedMergeTree('/test/02433/{database}/dep', '1') ORDER BY tuple();
CREATE TABLE dep2
(
    `id` Int32,
    `country` LowCardinality(String),
    `purchase_location` UInt16 MATERIALIZED if(id IN joinGet(concat(currentDatabase(), '.id_join'), 'location', 'CLICK'), 123, 456)
)
ENGINE = ReplicatedMergeTree('/test/02433/{database}/dep', '2') ORDER BY tuple();
-- Ensure that a table name cannot be passed to IN as string literal
create table test (n int, m default n in 'default.table_name') engine=Memory; -- { serverError TYPE_MISMATCH }
create table test (n int, m default in(n, 'default.table_name')) engine=Memory; -- { serverError TYPE_MISMATCH }
