-- Tags: no-fasttest
SET allow_experimental_parallel_reading_from_replicas = 0;

SET enable_analyzer = 1;

SYSTEM DROP  TABLE IF EXISTS dist_vec;

CREATE TABLE dist_vec
(
    id UInt32,
    vec Array(Float32),
    INDEX idx_vec vec TYPE vector_similarity('hnsw', 'L2Distance', 2)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8, distributed_index_analysis_min_parts_to_activate = 0, distributed_index_analysis_min_indexes_size_to_activate = 10;

INSERT INTO dist_vec SELECT
    number,
    [number/100, number/100]
FROM numbers(100);

SELECT *
FROM dist_vec
ORDER BY L2Distance(vec, [0.3, 0.3]) ASC
LIMIT 4
SETTINGS use_skip_indexes = 0;

SELECT *
FROM dist_vec
ORDER BY L2Distance(vec, [0.3, 0.3]) ASC
LIMIT 4;

SELECT *
FROM dist_vec
ORDER BY L2Distance(vec, [0.3, 0.3]) ASC
LIMIT 4
SETTINGS
    distributed_index_analysis_for_non_shared_merge_tree = 1,
    distributed_index_analysis = 1,
    max_parallel_replicas = 3,
    cluster_for_parallel_replicas = 'parallel_replicas';

SELECT format('distributed_index_analysis={}, DistributedIndexAnalysisMicroseconds>0={}, DistributedIndexAnalysisMissingParts={}, DistributedIndexAnalysisScheduledReplicas={}, DistributedIndexAnalysisFailedReplicas>0={}', `Settings`['distributed_index_analysis'], ProfileEvents['DistributedIndexAnalysisMicroseconds'] > 0, ProfileEvents['DistributedIndexAnalysisMissingParts'], ProfileEvents['DistributedIndexAnalysisScheduledReplicas'], ProfileEvents['DistributedIndexAnalysisFailedReplicas'] > 0)
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND event_date >= yesterday()
    AND type = 'QueryFinish'
    AND query_kind = 'Select'
    AND is_initial_query
    AND has(`Settings`, 'distributed_index_analysis')
    AND endsWith(log_comment, concat('-', currentDatabase()))
ORDER BY event_time_microseconds ASC;

-- Presence of this metric confirms vector index was used after index analysis
SELECT sum(ProfileEvents['USearchSearchCount']) > 0
FROM `system`.query_log
WHERE initial_query_id = (
        SELECT query_id
        FROM `system`.query_log
        WHERE current_database = currentDatabase()
            AND event_date >= yesterday()
            AND type = 'QueryFinish'
            AND query_kind = 'Select'
            AND is_initial_query
            AND has(`Settings`, 'distributed_index_analysis')
            AND endsWith(log_comment, concat('-', currentDatabase()))
    );