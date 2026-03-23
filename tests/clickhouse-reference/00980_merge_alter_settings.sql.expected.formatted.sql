-- Tags: no-replicated-database, log-engine
-- Tag no-replicated-database: Unsupported type of ALTER query
DROP TABLE IF EXISTS log_for_alter;

CREATE TABLE log_for_alter
(
    id UInt64,
    Data String
)
ENGINE = Log();

DROP TABLE IF EXISTS table_for_alter;

CREATE TABLE table_for_alter
(
    id UInt64,
    Data String
)
ENGINE = MergeTree()
ORDER BY id
SETTINGS index_granularity = 4096, index_granularity_bytes = '10Mi';

INSERT INTO table_for_alter;

INSERT INTO table_for_alter; -- { serverError TOO_MANY_PARTS }

SELECT COUNT()
FROM table_for_alter;

DROP TABLE IF EXISTS table_for_reset_setting;

CREATE TABLE table_for_reset_setting
(
    id UInt64,
    Data String
)
ENGINE = MergeTree()
ORDER BY id
SETTINGS index_granularity = 4096, index_granularity_bytes = '10Mi';

INSERT INTO table_for_reset_setting;

INSERT INTO table_for_reset_setting;