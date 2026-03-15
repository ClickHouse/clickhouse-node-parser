-- test regular merge tree
CREATE TABLE tp
(
    type Int32,
    eventcnt UInt64,
    PROJECTION p (    SELECT
        sum(eventcnt),
        type
    GROUP BY type)
)
ENGINE = MergeTree
ORDER BY type;

CREATE TABLE tp
(
    type Int32,
    eventcnt UInt64,
    PROJECTION p (    SELECT
        sum(eventcnt),
        type
    GROUP BY type)
)
ENGINE = MergeTree
ORDER BY type
SETTINGS deduplicate_merge_projection_mode = 'drop';

-- test irregular merge tree
CREATE TABLE tp
(
    type Int32,
    eventcnt UInt64,
    PROJECTION p (    SELECT
        sum(eventcnt),
        type
    GROUP BY type)
)
ENGINE = ReplacingMergeTree
ORDER BY type; -- { serverError SUPPORT_IS_DISABLED }

CREATE TABLE tp
(
    type Int32,
    eventcnt UInt64,
    PROJECTION p (    SELECT
        sum(eventcnt),
        type
    GROUP BY type)
)
ENGINE = ReplacingMergeTree
ORDER BY type
SETTINGS deduplicate_merge_projection_mode = 'throw'; -- { serverError SUPPORT_IS_DISABLED }

CREATE TABLE tp
(
    type Int32,
    eventcnt UInt64,
    PROJECTION p (    SELECT
        sum(eventcnt),
        type
    GROUP BY type)
)
ENGINE = ReplacingMergeTree
ORDER BY type
SETTINGS deduplicate_merge_projection_mode = 'drop';

-- expecting no projection
SELECT name
FROM `system`.projection_parts
WHERE (database = currentDatabase())
    AND (table = 'tp')
    AND (active = 1);

CREATE TABLE tp
(
    type Int32,
    eventcnt UInt64,
    PROJECTION p (    SELECT
        sum(eventcnt),
        type
    GROUP BY type)
)
ENGINE = ReplacingMergeTree
ORDER BY type
SETTINGS deduplicate_merge_projection_mode = 'rebuild';

-- test alter add projection case
CREATE TABLE tp
(
    type Int32,
    eventcnt UInt64
)
ENGINE = ReplacingMergeTree
ORDER BY type;