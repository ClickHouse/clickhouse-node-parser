-- Tags: no-fasttest, no-ordinary-database, no-parallel-replicas
--- no-parallel-replicas: Because the test records and verifies
--- _distance values returned from the rescoring optimization.
-- Issue #85514
--
-- Tests that the rescoring optimization works when distance function is
-- present explicitly in the SELECT columns list, apart from ORDER BY.
-- The return type of the cosineDistance/L2Distance function will vary
-- based on the data type of the 2 input arguments.
SET enable_analyzer = 1;

SET vector_search_with_rescoring = 0;

SYSTEM DROP  TABLE IF EXISTS tab_f32;

SYSTEM DROP  TABLE IF EXISTS tab_bf16;

CREATE TABLE tab_f32
(
    id Int32,
    vec Array(Float32),
    INDEX vector_index vec TYPE vector_similarity('hnsw', 'L2Distance', 2)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 1;

CREATE TABLE tab_bf16
(
    id Int32,
    vec Array(BFloat16),
    INDEX vector_index vec TYPE vector_similarity('hnsw', 'L2Distance', 2)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 1;

INSERT INTO tab_f32;

INSERT INTO tab_bf16;

SELECT '-- Search vector: Array(Float64)';

SYSTEM DROP  TABLE tab_f32;

SYSTEM DROP  TABLE tab_bf16;