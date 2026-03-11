SELECT *
FROM merge_tree_in_subqueries
WHERE id IN (
        SELECT *
        FROM `system`.numbers
        LIMIT 0
    )
SETTINGS
    enable_parallel_replicas = 2,
    parallel_replicas_allow_in_with_subquery = 0;

SELECT *
FROM merge_tree_in_subqueries
WHERE id IN (
        SELECT *
        FROM `system`.numbers
        LIMIT 0
    )
SETTINGS
    enable_parallel_replicas = 2,
    parallel_replicas_allow_in_with_subquery = 1;

SELECT *
FROM merge_tree_in_subqueries
WHERE id IN (
        SELECT *
        FROM `system`.numbers
        LIMIT 0
    )
SETTINGS enable_parallel_replicas = 1;

SELECT '---';

SELECT *
FROM merge_tree_in_subqueries
WHERE id IN (
        SELECT *
        FROM `system`.numbers
        LIMIT 2, 3
    )
ORDER BY id ASC
SETTINGS
    enable_parallel_replicas = 2,
    parallel_replicas_allow_in_with_subquery = 0;

SELECT *
FROM merge_tree_in_subqueries
WHERE id IN (
        SELECT *
        FROM `system`.numbers
        LIMIT 2, 3
    )
ORDER BY id ASC
SETTINGS
    enable_parallel_replicas = 2,
    parallel_replicas_allow_in_with_subquery = 1;

SELECT *
FROM merge_tree_in_subqueries
WHERE id IN (
        SELECT *
        FROM `system`.numbers
        LIMIT 2, 3
    )
ORDER BY id ASC
SETTINGS enable_parallel_replicas = 1;

SELECT *
FROM merge_tree_in_subqueries
WHERE id IN (
        SELECT 1
    )
ORDER BY id ASC
SETTINGS
    enable_parallel_replicas = 2,
    parallel_replicas_allow_in_with_subquery = 0;

SELECT *
FROM merge_tree_in_subqueries
WHERE id IN (
        SELECT 1
    )
ORDER BY id ASC
SETTINGS
    enable_parallel_replicas = 2,
    parallel_replicas_allow_in_with_subquery = 1;

SELECT *
FROM merge_tree_in_subqueries
WHERE id IN (
        SELECT 1
    )
ORDER BY id ASC
SETTINGS enable_parallel_replicas = 1;

SELECT
    id,
    name
FROM merge_tree_in_subqueries
WHERE (id, name) IN (3, 'test3')
SETTINGS
    enable_parallel_replicas = 2,
    parallel_replicas_allow_in_with_subquery = 0;

SELECT
    id,
    name
FROM merge_tree_in_subqueries
WHERE (id, name) IN (3, 'test3')
SETTINGS
    enable_parallel_replicas = 2,
    parallel_replicas_allow_in_with_subquery = 1;