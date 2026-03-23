-- Ensure that sparse columns does not leads to any errors/warnings while pushing via Distributed
SYSTEM drop  table if exists sparse;

SYSTEM drop  table if exists intermediate;

SYSTEM drop  table if exists non_sparse;

SYSTEM drop  table if exists non_sparse_remote;

SYSTEM drop  table if exists mv_non_sparse;

SYSTEM drop  table if exists log;

SYSTEM drop  table if exists log_remote;

SYSTEM drop  table if exists mv_log;

CREATE TABLE sparse
(
    key String
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.01;

INSERT INTO sparse SELECT ''::String
FROM numbers(100);

SELECT dumpColumnStructure(*)
FROM sparse
LIMIT 1;

-- we need a table that supports sparse columns as intermediate, hence MergeTree
CREATE TABLE intermediate
(
    key String
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE non_sparse
(
    key String
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS ratio_of_defaults_for_sparse_serialization = 1;

CREATE TABLE non_sparse_remote AS remote('127.1', currentDatabase(), non_sparse);

CREATE MATERIALIZED VIEW mv_non_sparse
TO non_sparse_remote
AS
SELECT *
FROM intermediate;

-- now ensure that insert into Log will not break anything
CREATE TABLE log
(
    key String
)
ENGINE = Log;

CREATE TABLE log_remote AS remote('127.1', currentDatabase(), log);

CREATE MATERIALIZED VIEW mv_log
TO log
AS
SELECT *
FROM intermediate;

INSERT INTO intermediate SELECT *
FROM sparse;

SELECT count()
FROM non_sparse;

SELECT count()
FROM mv_log;