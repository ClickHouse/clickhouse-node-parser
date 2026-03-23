--- See also tests/queries/0_stateless/01581_deduplicate_by_columns_replicated.sql

--- local case

-- Just in case if previous tests run left some stuff behind.
DROP TABLE IF EXISTS source_data;
CREATE TABLE source_data (
    pk Int32, sk Int32, val UInt32, partition_key UInt32 DEFAULT 1,
    PRIMARY KEY (pk)
) ENGINE=MergeTree
ORDER BY (pk, sk);
INSERT INTO source_data (pk, sk, val) VALUES (0, 0, 0), (0, 0, 0), (1, 1, 2), (1, 1, 3);
SELECT 'TOTAL rows', count() FROM source_data;
DROP TABLE IF EXISTS full_duplicates;
-- table with duplicates on MATERIALIZED columns
CREATE TABLE full_duplicates  (
    pk Int32, sk Int32, val UInt32, partition_key UInt32, mat UInt32 MATERIALIZED 12345, alias UInt32 ALIAS 2,
    PRIMARY KEY (pk)
) ENGINE=MergeTree
PARTITION BY (partition_key + 1) -- ensure that column in expression is properly handled when deduplicating. See [1] below.
ORDER BY (pk, toString(sk * 10)); -- silly order key to ensure that key column is checked even when it is a part of expression. See [1] below.
INSERT INTO full_duplicates SELECT * FROM source_data;
SELECT * FROM full_duplicates;
--DROP TABLE full_duplicates;

-- Now to the partial duplicates when MATERIALIZED column alway has unique value.
DROP TABLE IF EXISTS partial_duplicates;
CREATE TABLE partial_duplicates  (
    pk Int32, sk Int32, val UInt32, partition_key UInt32 DEFAULT 1, mat UInt32 MATERIALIZED rand(), alias UInt32 ALIAS 2,
    PRIMARY KEY (pk)
) ENGINE=MergeTree
ORDER BY (pk, sk);
INSERT INTO partial_duplicates SELECT * FROM source_data;
SELECT count() FROM partial_duplicates;
SELECT * FROM partial_duplicates;
DROP TABLE full_duplicates;
DROP TABLE partial_duplicates;
DROP TABLE source_data;
