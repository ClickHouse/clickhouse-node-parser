SELECT *
FROM users_compact
ORDER BY uid ASC;

-- all_1_1_0_2
SELECT name
FROM `system`.parts
WHERE (database = currentDatabase())
    AND (table = 'users_compact')
    AND (active = 1);

-- expecting no projection
SELECT
    name,
    parent_name
FROM `system`.projection_parts
WHERE (database = currentDatabase())
    AND (table = 'users_compact')
    AND (active = 1);

-- expecting projection p1, p2
SELECT
    name,
    parent_name
FROM `system`.projection_parts
WHERE (database = currentDatabase())
    AND (table = 'users_compact')
    AND (active = 1)
    AND like(parent_name, 'all_3_3%');

SELECT *
FROM users_wide
ORDER BY uid ASC;

-- all_1_1_0_2
SELECT name
FROM `system`.parts
WHERE (database = currentDatabase())
    AND (table = 'users_wide')
    AND (active = 1);

-- expecting no projection
SELECT
    name,
    parent_name
FROM `system`.projection_parts
WHERE (database = currentDatabase())
    AND (table = 'users_wide')
    AND (active = 1);

-- expecting projection p1, p2
SELECT
    name,
    parent_name
FROM `system`.projection_parts
WHERE (database = currentDatabase())
    AND (table = 'users_wide')
    AND (active = 1)
    AND like(parent_name, 'all_3_3%');