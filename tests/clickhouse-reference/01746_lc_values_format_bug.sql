CREATE TABLE lc_test
(
    `id` LowCardinality(String)
)
ENGINE = MergeTree
PARTITION BY tuple()
ORDER BY id;
select id from lc_test;
