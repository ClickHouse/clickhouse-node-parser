-- test regular merge tree
CREATE TABLE tp (
    type Int32,
    eventcnt UInt64,
    PROJECTION p (select sum(eventcnt), type group by type)
) engine = MergeTree order by type;
INSERT INTO tp SELECT number%3, 1 FROM numbers(3);
CREATE TABLE tp (
    type Int32,
    eventcnt UInt64,
    PROJECTION p (select sum(eventcnt), type group by type)
) engine = MergeTree order by type
SETTINGS deduplicate_merge_projection_mode = 'drop';
-- test irregular merge tree
CREATE TABLE tp (
    type Int32,
    eventcnt UInt64,
    PROJECTION p (select sum(eventcnt), type group by type)
) engine = ReplacingMergeTree order by type;  -- { serverError SUPPORT_IS_DISABLED }
CREATE TABLE tp (
    type Int32,
    eventcnt UInt64,
    PROJECTION p (select sum(eventcnt), type group by type)
) engine = ReplacingMergeTree order by type
SETTINGS deduplicate_merge_projection_mode = 'throw';  -- { serverError SUPPORT_IS_DISABLED }
CREATE TABLE tp (
    type Int32,
    eventcnt UInt64,
    PROJECTION p (select sum(eventcnt), type group by type)
) engine = ReplacingMergeTree order by type
SETTINGS deduplicate_merge_projection_mode = 'drop';
-- expecting no projection
SELECT
    name
FROM system.projection_parts
WHERE (database = currentDatabase()) AND (`table` = 'tp') AND (active = 1);
CREATE TABLE tp (
    type Int32,
    eventcnt UInt64,
    PROJECTION p (select sum(eventcnt), type group by type)
) engine = ReplacingMergeTree order by type
SETTINGS deduplicate_merge_projection_mode = 'rebuild';
-- test alter add projection case
CREATE TABLE tp (
    type Int32,
    eventcnt UInt64
) engine = ReplacingMergeTree order by type;
