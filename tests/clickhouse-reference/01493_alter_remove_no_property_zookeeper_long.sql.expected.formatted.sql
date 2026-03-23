-- Tags: long, zookeeper
DROP TABLE IF EXISTS no_prop_table;

CREATE TABLE no_prop_table
(
    some_column UInt64
)
ENGINE = MergeTree()
ORDER BY tuple();

-- just nothing happened
ALTER TABLE no_prop_table MODIFY COLUMN some_column; --{serverError BAD_ARGUMENTS}

ALTER TABLE no_prop_table MODIFY COLUMN some_column; --{serverError BAD_ARGUMENTS}

ALTER TABLE no_prop_table MODIFY COLUMN some_column; --{serverError BAD_ARGUMENTS}

ALTER TABLE no_prop_table MODIFY COLUMN some_column; --{serverError BAD_ARGUMENTS}

ALTER TABLE no_prop_table MODIFY COLUMN some_column; --{serverError BAD_ARGUMENTS}

ALTER TABLE no_prop_table MODIFY COLUMN some_column; --{serverError BAD_ARGUMENTS}

ALTER TABLE no_prop_table REMOVE TTL; --{serverError BAD_ARGUMENTS}

DROP TABLE IF EXISTS r_no_prop_table;

CREATE TABLE r_no_prop_table
(
    some_column UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test/01493_r_no_prop_table', '1')
ORDER BY tuple();

ALTER TABLE r_no_prop_table MODIFY COLUMN some_column; --{serverError BAD_ARGUMENTS}

ALTER TABLE r_no_prop_table MODIFY COLUMN some_column; --{serverError BAD_ARGUMENTS}

ALTER TABLE r_no_prop_table MODIFY COLUMN some_column; --{serverError BAD_ARGUMENTS}

ALTER TABLE r_no_prop_table MODIFY COLUMN some_column; --{serverError BAD_ARGUMENTS}

ALTER TABLE r_no_prop_table MODIFY COLUMN some_column; --{serverError BAD_ARGUMENTS}

ALTER TABLE r_no_prop_table MODIFY COLUMN some_column; --{serverError BAD_ARGUMENTS}

ALTER TABLE r_no_prop_table REMOVE TTL; --{serverError BAD_ARGUMENTS}