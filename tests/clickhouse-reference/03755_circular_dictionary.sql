CREATE DICTIONARY filesystem_dict
(
    `metric` String,
    `value` Int64
)
PRIMARY KEY metric
SOURCE(CLICKHOUSE(QUERY 'SELECT metric, value FROM system.metrics WHERE metric LIKE \'Filesystem%\''))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(COMPLEX_KEY_HASHED());
-- Kafka metrics dictionary
CREATE DICTIONARY kafka_dict
(
    `metric` String,
    `value` Int64
)
PRIMARY KEY metric
SOURCE(CLICKHOUSE(QUERY 'SELECT metric, value FROM system.metrics WHERE metric LIKE \'Kafka%\''))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(COMPLEX_KEY_HASHED());
-- MergeTree metrics dictionary
CREATE DICTIONARY mergetree_dict
(
    `metric` String,
    `value` Int64
)
PRIMARY KEY metric
SOURCE(CLICKHOUSE(QUERY 'SELECT metric, value FROM system.metrics WHERE metric LIKE \'MergeTree%\''))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(COMPLEX_KEY_HASHED());
-- DDLWorker metrics dictionary
CREATE DICTIONARY ddlworker_dict
(
    `metric` String,
    `value` Int64
)
PRIMARY KEY metric
SOURCE(CLICKHOUSE(QUERY 'SELECT metric, value FROM system.metrics WHERE metric LIKE \'DDLWorker%\''))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(COMPLEX_KEY_HASHED());
-- StorageS3 metrics dictionary
CREATE DICTIONARY storages3_dict
(
    `metric` String,
    `value` Int64
)
PRIMARY KEY metric
SOURCE(CLICKHOUSE(QUERY 'SELECT metric, value FROM system.metrics WHERE metric LIKE \'StorageS3%\''))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(COMPLEX_KEY_HASHED());
-- Background metrics dictionary
CREATE DICTIONARY background_dict
(
    `metric` String,
    `value` Int64
)
PRIMARY KEY metric
SOURCE(CLICKHOUSE(QUERY 'SELECT metric, value FROM system.metrics WHERE metric LIKE \'Background%\''))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(COMPLEX_KEY_HASHED());
-- TemporaryFiles metrics dictionary
CREATE DICTIONARY temporaryfiles_dict
(
    `metric` String,
    `value` Int64
)
PRIMARY KEY metric
SOURCE(CLICKHOUSE(QUERY 'SELECT metric, value FROM system.metrics WHERE metric LIKE \'TemporaryFiles%\''))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(COMPLEX_KEY_HASHED());
-- Parts metrics dictionary
CREATE DICTIONARY parts_dict
(
    `metric` String,
    `value` Int64
)
PRIMARY KEY metric
SOURCE(CLICKHOUSE(QUERY 'SELECT metric, value FROM system.metrics WHERE metric LIKE \'Parts%\''))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(COMPLEX_KEY_HASHED());
-- DistrCache metrics dictionary
CREATE DICTIONARY distrcache_dict
(
    `metric` String,
    `value` Int64
)
PRIMARY KEY metric
SOURCE(CLICKHOUSE(QUERY 'SELECT metric, value FROM system.metrics WHERE metric LIKE \'DistrCache%\''))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(COMPLEX_KEY_HASHED());
-- Drop metrics dictionary
CREATE DICTIONARY drop_dict
(
    `metric` String,
    `value` Int64
)
PRIMARY KEY metric
SOURCE(CLICKHOUSE(QUERY 'SELECT metric, value FROM system.metrics WHERE metric LIKE \'Drop%\''))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(COMPLEX_KEY_HASHED());
CREATE TABLE background_metrics
(
    `metric` String,
    `value` Int64,
    PROJECTION values
    (
        SELECT
            metric,
            dictGet('background_dict', 'value', metric) AS value
        ORDER BY value
    )
)
ENGINE = MergeTree
ORDER BY metric;
CREATE TABLE ddlworker_metrics
(
    `metric` String,
    `value` Int64,
    PROJECTION values
    (
        SELECT
            metric,
            dictGet('ddlworker_dict', 'value', metric) AS value
        ORDER BY value
    )
)
ENGINE = MergeTree
ORDER BY metric;
CREATE TABLE distrcache_metrics
(
    `metric` String,
    `value` Int64,
    PROJECTION values
    (
        SELECT
            metric,
            dictGet('distrcache_dict', 'value', metric) AS value
        ORDER BY value
    )
)
ENGINE = MergeTree
ORDER BY metric;
CREATE TABLE drop_metrics
(
    `metric` String,
    `value` Int64,
    PROJECTION values
    (
        SELECT
            metric,
            dictGet('drop_dict', 'value', metric) AS value
        ORDER BY value
    )
)
ENGINE = MergeTree
ORDER BY metric;
CREATE TABLE filesystem_metrics
(
    `metric` String,
    `value` Int64,
    PROJECTION values
    (
        SELECT
            metric,
            dictGet('filesystem_dict', 'value', metric) AS value
        ORDER BY value
    )
)
ENGINE = MergeTree
ORDER BY metric;
CREATE TABLE kafka_metrics
(
    `metric` String,
    `value` Int64,
    PROJECTION values
    (
        SELECT
            metric,
            dictGet('kafka_dict', 'value', metric) AS value
        ORDER BY value
    )
)
ENGINE = MergeTree
ORDER BY metric;
CREATE TABLE mergetree_metrics
(
    `metric` String,
    `value` Int64,
    PROJECTION values
    (
        SELECT
            metric,
            dictGet('mergetree_dict', 'value', metric) AS value
        ORDER BY value
    )
)
ENGINE = MergeTree
ORDER BY metric;
CREATE TABLE parts_metrics
(
    `metric` String,
    `value` Int64,
    PROJECTION values
    (
        SELECT
            metric,
            dictGet('parts_dict', 'value', metric) AS value
        ORDER BY value
    )
)
ENGINE = MergeTree
ORDER BY metric;
CREATE TABLE storages3_metrics
(
    `metric` String,
    `value` Int64,
    PROJECTION values
    (
        SELECT
            metric,
            dictGet('storages3_dict', 'value', metric) AS value
        ORDER BY value
    )
)
ENGINE = MergeTree
ORDER BY metric;
CREATE TABLE temporaryfiles_metrics
(
    `metric` String,
    `value` Int64,
    PROJECTION values
    (
        SELECT
            metric,
            dictGet('temporaryfiles_dict', 'value', metric) AS value
        ORDER BY value
    )
)
ENGINE = MergeTree
ORDER BY metric;
INSERT INTO background_metrics SELECT metric, value FROM system.metrics WHERE metric IN (SELECT metric FROM background_dict) ;
INSERT INTO ddlworker_metrics SELECT metric, value FROM system.metrics WHERE metric IN (SELECT metric FROM ddlworker_dict) ;
INSERT INTO distrcache_metrics SELECT metric, value FROM system.metrics WHERE metric IN (SELECT metric FROM distrcache_dict) ;
INSERT INTO drop_metrics SELECT metric, value FROM system.metrics WHERE metric IN (SELECT metric FROM drop_dict) ;
INSERT INTO filesystem_metrics SELECT metric, value FROM system.metrics WHERE metric IN (SELECT metric FROM filesystem_dict) ;
INSERT INTO kafka_metrics SELECT metric, value FROM system.metrics WHERE metric IN (SELECT metric FROM kafka_dict) ;
INSERT INTO mergetree_metrics SELECT metric, value FROM system.metrics WHERE metric IN (SELECT metric FROM mergetree_dict) ;
INSERT INTO parts_metrics SELECT metric, value FROM system.metrics WHERE metric IN (SELECT metric FROM parts_dict) ;
INSERT INTO storages3_metrics SELECT metric, value FROM system.metrics WHERE metric IN (SELECT metric FROM storages3_dict) ;
INSERT INTO temporaryfiles_metrics SELECT metric, value FROM system.metrics WHERE metric IN (SELECT metric FROM temporaryfiles_dict) ;
