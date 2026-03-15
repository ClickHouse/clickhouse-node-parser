-- Tags: no-parallel
SET send_logs_level = 'fatal';

CREATE DATABASE db_01517_atomic
ENGINE = Atomic;

CREATE TABLE db_01517_atomic.source
(
    key Int
)
ENGINE = Null;

CREATE MATERIALIZED VIEW db_01517_atomic.mv
ENGINE = Null
AS
SELECT *
FROM db_01517_atomic.source;

CREATE DATABASE db_01517_atomic_sync
ENGINE = Atomic;

CREATE TABLE db_01517_atomic_sync.source
(
    key Int
)
ENGINE = Null;

CREATE MATERIALIZED VIEW db_01517_atomic_sync.mv
ENGINE = Null
AS
SELECT *
FROM db_01517_atomic_sync.source;

SET allow_deprecated_database_ordinary = 1;

-- Creation of a database with Ordinary engine emits a warning.
CREATE DATABASE db_01517_ordinary
ENGINE = Ordinary;

CREATE TABLE db_01517_ordinary.source
(
    key Int
)
ENGINE = Null;

CREATE MATERIALIZED VIEW db_01517_ordinary.mv
ENGINE = Null
AS
SELECT *
FROM db_01517_ordinary.source;