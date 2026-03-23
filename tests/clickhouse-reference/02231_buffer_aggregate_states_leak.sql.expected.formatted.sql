-- Tags: long, no-tsan
SYSTEM drop  table if exists buffer_02231;

SYSTEM drop  table if exists out_02231;

SYSTEM drop  table if exists in_02231;

SYSTEM drop  table if exists mv_02231;

-- To reproduce leak of memory tracking of aggregate states,
-- background flush is required.
CREATE TABLE buffer_02231
(
    key Int,
    v1 AggregateFunction(groupArray, String)
)
ENGINE = Buffer(currentDatabase(), 'out_02231', 1, 86400, 86400, 1e9, 1e9, 1e12, 1e12, 1);

CREATE TABLE out_02231 AS buffer_02231
ENGINE = Null();

CREATE TABLE in_02231
(
    number Int
)
ENGINE = Null();

-- Create lots of INSERT blocks with MV
CREATE MATERIALIZED VIEW mv_02231
TO buffer_02231
AS
SELECT
    number AS key,
    groupArrayState(toString(number)) AS v1
FROM in_02231
GROUP BY key;

SET optimize_trivial_insert_select = 1;

INSERT INTO in_02231 SELECT *
FROM numbers(5e6)
SETTINGS
    max_memory_usage = '400Mi',
    max_threads = 1;

SYSTEM drop  table buffer_02231;

SYSTEM drop  table out_02231;

SYSTEM drop  table in_02231;

SYSTEM drop  table mv_02231;