DROP TABLE IF EXISTS table_with_version;

CREATE TABLE table_with_version
(
    key UInt64,
    value String,
    version UInt8,
    sign Int8
)
ENGINE = VersionedCollapsingMergeTree(sign, version)
ORDER BY key;

INSERT INTO table_with_version;

INSERT INTO table_with_version;

SELECT *
FROM table_with_version
ORDER BY key ASC;

ALTER TABLE table_with_version MODIFY COLUMN version UInt32;

INSERT INTO table_with_version;

INSERT INTO table_with_version;

SELECT *
FROM table_with_version FINAL
ORDER BY key ASC;

INSERT INTO table_with_version;

INSERT INTO table_with_version;

ALTER TABLE table_with_version MODIFY COLUMN version String; --{serverError ALTER_OF_COLUMN_IS_FORBIDDEN}

ALTER TABLE table_with_version MODIFY COLUMN version Int64; --{serverError ALTER_OF_COLUMN_IS_FORBIDDEN}

ALTER TABLE table_with_version MODIFY COLUMN version UInt16; --{serverError ALTER_OF_COLUMN_IS_FORBIDDEN}

ALTER TABLE table_with_version MODIFY COLUMN version Float64; --{serverError ALTER_OF_COLUMN_IS_FORBIDDEN}

ALTER TABLE table_with_version MODIFY COLUMN version Date; --{serverError ALTER_OF_COLUMN_IS_FORBIDDEN}

ALTER TABLE table_with_version MODIFY COLUMN version DateTime; --{serverError ALTER_OF_COLUMN_IS_FORBIDDEN}