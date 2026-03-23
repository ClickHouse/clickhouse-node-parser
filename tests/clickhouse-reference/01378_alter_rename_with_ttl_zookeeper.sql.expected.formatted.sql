-- Tags: zookeeper
DROP TABLE IF EXISTS table_rename_with_ttl;

CREATE TABLE table_rename_with_ttl
(
    date1 Date,
    value1 String
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test/table_rename_with_ttl_01378', '1')
ORDER BY tuple();

INSERT INTO table_rename_with_ttl SELECT
    toDate('2018-10-01') + number % 3,
    toString(number)
FROM numbers(9);

SELECT count()
FROM table_rename_with_ttl;

SET materialize_ttl_after_modify = 0;