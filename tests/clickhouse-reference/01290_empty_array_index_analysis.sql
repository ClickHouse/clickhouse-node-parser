CREATE TABLE count_lc_test
(
    `s` LowCardinality(String),
    `arr` Array(LowCardinality(String)),
    `num` UInt64
)
ENGINE = MergeTree
ORDER BY (s, arr);
SELECT '--- notEmpty';
select * from count_lc_test where notEmpty(arr);
select * from count_lc_test where empty(arr);
select * from count_lc_test where arr = [];
select * from count_lc_test where arr != [];
select * from count_lc_test where arr > [];
select * from count_lc_test where arr < [];
select * from count_lc_test where arr >= [];
select * from count_lc_test where arr <= [];
CREATE TABLE count_lc_test
(
    `s` LowCardinality(String),
    `arr` Array(String),
    `num` UInt64
)
ENGINE = MergeTree
ORDER BY (s, arr);
