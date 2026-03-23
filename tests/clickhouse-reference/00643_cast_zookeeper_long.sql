-- Tags: long, zookeeper

SET database_atomic_wait_for_drop_and_detach_synchronously=1;
CREATE TABLE cast1
(
    x UInt8,
    e Enum8
    (
        'hello' = 1,
        'world' = 2
    )
    DEFAULT
    CAST
    (
        x
        AS
        Enum8
        (
            'hello' = 1,
            'world' = 2
        )
    )
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00643/cast', 'r1') ORDER BY e;
INSERT INTO cast1 (x) VALUES (1);
SELECT * FROM cast1;
CREATE TABLE cast2 AS cast1 ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00643/cast', 'r2') ORDER BY e;
SELECT * FROM cast2;
