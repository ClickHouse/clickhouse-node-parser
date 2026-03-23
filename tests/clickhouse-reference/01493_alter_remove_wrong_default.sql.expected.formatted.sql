DROP TABLE IF EXISTS default_table;

CREATE TABLE default_table
(
    key UInt64 DEFAULT 42,
    value1 UInt64 MATERIALIZED key * key,
    value2 ALIAS value1 * key
)
ENGINE = MergeTree()
ORDER BY tuple();

ALTER TABLE default_table MODIFY COLUMN key; --{serverError BAD_ARGUMENTS}

ALTER TABLE default_table MODIFY COLUMN key; --{serverError BAD_ARGUMENTS}

ALTER TABLE default_table MODIFY COLUMN value1; --{serverError BAD_ARGUMENTS}

ALTER TABLE default_table MODIFY COLUMN value1; --{serverError BAD_ARGUMENTS}

ALTER TABLE default_table MODIFY COLUMN value2; --{serverError BAD_ARGUMENTS}

ALTER TABLE default_table MODIFY COLUMN value2; --{serverError BAD_ARGUMENTS}