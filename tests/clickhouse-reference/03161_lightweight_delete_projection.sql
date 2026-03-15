-- For cloud version, should also consider min_bytes_for_full_part_storage since packed storage exists,
-- but for less redundancy, just let CI test the parameter.

SET lightweight_deletes_sync = 2, alter_sync = 2;
CREATE TABLE users_compact (
    uid Int16,
    name String,
    age Int16,
    projection p1 (select count(), age group by age),
    projection p2 (select age, name group by age, name)
) ENGINE = MergeTree order by uid
SETTINGS min_bytes_for_wide_part = 10485760;
SELECT * FROM users_compact ORDER BY uid;
-- all_1_1_0_2
SELECT
    name
FROM system.parts
WHERE (database = currentDatabase()) AND (`table` = 'users_compact') AND (active = 1);
-- expecting no projection
SELECT
    name, parent_name
FROM system.projection_parts
WHERE (database = currentDatabase()) AND (`table` = 'users_compact') AND (active = 1);
-- expecting projection p1, p2
SELECT
    name, parent_name
FROM system.projection_parts
WHERE (database = currentDatabase()) AND (`table` = 'users_compact') AND (active = 1) AND parent_name like 'all_3_3%';
CREATE TABLE users_wide (
    uid Int16,
    name String,
    age Int16,
    projection p1 (select count(), age group by age),
    projection p2 (select age, name group by age, name)
) ENGINE = MergeTree order by uid
SETTINGS min_bytes_for_wide_part = 0;
SELECT * FROM users_wide ORDER BY uid;
-- all_1_1_0_2
SELECT
    name
FROM system.parts
WHERE (database = currentDatabase()) AND (`table` = 'users_wide') AND (active = 1);
-- expecting no projection
SELECT
    name, parent_name
FROM system.projection_parts
WHERE (database = currentDatabase()) AND (`table` = 'users_wide') AND (active = 1);
-- expecting projection p1, p2
SELECT
    name, parent_name
FROM system.projection_parts
WHERE (database = currentDatabase()) AND (`table` = 'users_wide') AND (active = 1) AND parent_name like 'all_3_3%';
