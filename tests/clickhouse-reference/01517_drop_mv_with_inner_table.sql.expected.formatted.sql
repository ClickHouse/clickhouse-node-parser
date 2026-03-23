-- Tags: no-parallel
SET send_logs_level = 'fatal';

--
-- Atomic no SYNC
-- (should go first to check that thread for DROP TABLE does not hang)
--
SYSTEM drop  database if exists db_01517_atomic;

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

SYSTEM drop  table db_01517_atomic.mv;

-- ensure that the inner had been removed after sync drop
SYSTEM drop  table db_01517_atomic.source sync;

--
-- Atomic
--
SYSTEM drop  database if exists db_01517_atomic_sync;

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

-- drops it and hangs with Atomic engine, due to recursive DROP
SYSTEM drop  table db_01517_atomic_sync.mv sync;

--
-- Ordinary
---
SYSTEM drop  database if exists db_01517_ordinary;

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

-- drops it and hangs with Atomic engine, due to recursive DROP
SYSTEM drop  table db_01517_ordinary.mv sync;

SYSTEM drop  table db_01517_atomic_sync.source;

SYSTEM drop  table db_01517_ordinary.source;

SYSTEM drop  database db_01517_atomic;

SYSTEM drop  database db_01517_atomic_sync;

SYSTEM drop  database db_01517_ordinary;