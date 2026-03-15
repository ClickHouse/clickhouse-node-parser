CREATE TABLE tp
(
    type Int32,
    eventcnt UInt64,
    PROJECTION p (    SELECT
        type,
        sum(eventcnt)
    GROUP BY type)
)
ENGINE = ReplacingMergeTree
ORDER BY type
SETTINGS deduplicate_merge_projection_mode = 'rebuild';

SET parallel_replicas_local_plan = 1, parallel_replicas_support_projection = 1, optimize_aggregation_in_order = 0;

SELECT
    type,
    sum(eventcnt)
FROM tp
GROUP BY type
ORDER BY type ASC
SETTINGS
    optimize_use_projections = 0,
    force_optimize_projection = 0;

SELECT
    type,
    sum(eventcnt)
FROM tp
GROUP BY type
ORDER BY type ASC
SETTINGS
    optimize_use_projections = 1,
    force_optimize_projection = 1;

CREATE TABLE tp
(
    type Int32,
    eventcnt UInt64,
    sign Int8,
    PROJECTION p (    SELECT
        type,
        sum(eventcnt)
    GROUP BY type)
)
ENGINE = CollapsingMergeTree(sign)
ORDER BY type
SETTINGS deduplicate_merge_projection_mode = 'rebuild';

CREATE TABLE tp
(
    type Int32,
    eventcnt UInt64,
    sign Int8,
    version UInt8,
    PROJECTION p (    SELECT
        type,
        sum(eventcnt)
    GROUP BY type)
)
ENGINE = VersionedCollapsingMergeTree(sign, version)
ORDER BY type
SETTINGS deduplicate_merge_projection_mode = 'rebuild';

CREATE TABLE tp
(
    type Int32,
    eventcnt UInt64,
    PROJECTION p (    SELECT
        type,
        sum(eventcnt)
    GROUP BY type)
)
ENGINE = MergeTree
ORDER BY type
SETTINGS deduplicate_merge_projection_mode = 'rebuild';