drop table if exists count_lc_test;
CREATE TABLE count_lc_test
(
    `s` LowCardinality(String),
    `arr` Array(LowCardinality(String)),
    `num` UInt64
)
ENGINE = MergeTree
ORDER BY (s, arr);
INSERT INTO count_lc_test(num, arr) VALUES (1,[]),(2,['a']),(3,['a','b','c']),(4,['aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa']);
SELECT '--- notEmpty';
select * from count_lc_test where notEmpty(arr);
select * from count_lc_test where empty(arr);
select * from count_lc_test where arr = [];
select * from count_lc_test where arr != [];
select * from count_lc_test where arr > [];
select * from count_lc_test where arr < [];
select * from count_lc_test where arr >= [];
select * from count_lc_test where arr <= [];
DROP TABLE count_lc_test;
CREATE TABLE count_lc_test
(
    `s` LowCardinality(String),
    `arr` Array(String),
    `num` UInt64
)
ENGINE = MergeTree
ORDER BY (s, arr);
