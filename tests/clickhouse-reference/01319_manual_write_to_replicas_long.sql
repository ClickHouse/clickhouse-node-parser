CREATE TABLE r1 (x String) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/r', 'r1') ORDER BY x;
CREATE TABLE r2 (x String) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/r', 'r2') ORDER BY x;
INSERT INTO r1 VALUES ('Hello, world');
SELECT * FROM r1;
SELECT * FROM r2;
INSERT INTO r2 VALUES ('Hello, world');
SELECT '---';
