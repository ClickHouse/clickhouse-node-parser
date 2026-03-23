-- Tags: no-parallel
SET mutations_sync = 2;

-- system.parts has server default, timezone cannot be randomized
SET session_timezone = '';

SET allow_suspicious_ttl_expressions = 1;

SYSTEM drop  table if exists ttl;

CREATE TABLE ttl
(
    d Date,
    a Int
)
ENGINE = MergeTree
ORDER BY a
PARTITION BY toDayOfMonth(d)
SETTINGS max_number_of_merges_with_ttl_in_pool = 0, materialize_ttl_recalculate_only = true;

INSERT INTO ttl;

INSERT INTO ttl;

INSERT INTO ttl;

INSERT INTO ttl;

SELECT *
FROM ttl
ORDER BY a ASC;

SELECT
    delete_ttl_info_min,
    delete_ttl_info_max
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'ttl'
    AND active > 0
ORDER BY name ASC;

CREATE TABLE ttl
(
    i Int,
    s String
)
ENGINE = MergeTree
ORDER BY i
SETTINGS max_number_of_merges_with_ttl_in_pool = 0, materialize_ttl_recalculate_only = true;

INSERT INTO ttl;

SELECT *
FROM ttl
ORDER BY i ASC;

SELECT
    delete_ttl_info_min,
    delete_ttl_info_max
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'ttl'
    AND active > 0;

CREATE TABLE ttl
(
    d Date,
    i Int,
    s String
)
ENGINE = MergeTree
ORDER BY i
SETTINGS max_number_of_merges_with_ttl_in_pool = 0, materialize_ttl_recalculate_only = true;

INSERT INTO ttl;

SELECT
    i,
    s
FROM ttl
ORDER BY i ASC;

CREATE TABLE ttl
(
    i Int,
    s String,
    t String
)
ENGINE = MergeTree
ORDER BY i
SETTINGS max_number_of_merges_with_ttl_in_pool = 0, materialize_ttl_recalculate_only = true;

INSERT INTO ttl;

SELECT
    i,
    s,
    t
FROM ttl
ORDER BY i ASC;

-- MATERIALIZE TTL ran only once
SELECT count()
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'ttl'
    AND is_done;

-- Nothing changed, don't run mutation
CREATE TABLE ttl
(
    i Int,
    s String TTL toDate('2000-01-02')
)
ENGINE = MergeTree
ORDER BY i
SETTINGS max_number_of_merges_with_ttl_in_pool = 0, materialize_ttl_recalculate_only = true;