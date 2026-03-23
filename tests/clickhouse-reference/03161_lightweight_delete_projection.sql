-- For cloud version, should also consider min_bytes_for_full_part_storage since packed storage exists,
-- but for less redundancy, just let CI test the parameter.

SET lightweight_deletes_sync = 2, alter_sync = 2;
DROP TABLE IF EXISTS users_compact;
CREATE TABLE users_compact (
    uid Int16,
    name String,
    age Int16,
    projection p1 (select count(), age group by age),
    projection p2 (select age, name group by age, name)
) ENGINE = MergeTree order by uid
SETTINGS min_bytes_for_wide_part = 10485760;
INSERT INTO users_compact VALUES (1231, 'John', 33);
-- { echoOn }

ALTER TABLE users_compact MODIFY SETTING lightweight_mutation_projection_mode = 'throw';
ALTER TABLE users_compact MODIFY SETTING lightweight_mutation_projection_mode = 'drop';
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
INSERT INTO users_compact VALUES (6666, 'Ksenia', 48), (8888, 'Alice', 50);
ALTER TABLE users_compact MODIFY SETTING lightweight_mutation_projection_mode = 'rebuild';
-- expecting projection p1, p2
SELECT
    name, parent_name
FROM system.projection_parts
WHERE (database = currentDatabase()) AND (`table` = 'users_compact') AND (active = 1) AND parent_name like 'all_3_3%';
-- { echoOff }

DROP TABLE users_compact;
CREATE TABLE users_wide (
    uid Int16,
    name String,
    age Int16,
    projection p1 (select count(), age group by age),
    projection p2 (select age, name group by age, name)
) ENGINE = MergeTree order by uid
SETTINGS min_bytes_for_wide_part = 0;
INSERT INTO users_wide VALUES (1231, 'John', 33);
-- { echoOn }

ALTER TABLE users_wide MODIFY SETTING lightweight_mutation_projection_mode = 'throw';
ALTER TABLE users_wide MODIFY SETTING lightweight_mutation_projection_mode = 'drop';
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
INSERT INTO users_wide VALUES (6666, 'Ksenia', 48), (8888, 'Alice', 50);
ALTER TABLE users_wide MODIFY SETTING lightweight_mutation_projection_mode = 'rebuild';
-- expecting projection p1, p2
SELECT
    name, parent_name
FROM system.projection_parts
WHERE (database = currentDatabase()) AND (`table` = 'users_wide') AND (active = 1) AND parent_name like 'all_3_3%';
-- { echoOff }

DROP TABLE users_wide;
