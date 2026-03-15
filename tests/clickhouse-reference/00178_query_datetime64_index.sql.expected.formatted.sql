CREATE TABLE datetime64_index_tbl
(
    ts DateTime64(3, 'UTC')
)
ENGINE = MergeTree
ORDER BY ts;

SELECT ts
FROM datetime64_index_tbl
WHERE ts < toDate('2023-05-28');

SELECT ts
FROM datetime64_index_tbl
WHERE ts < toDate32('2023-05-28');