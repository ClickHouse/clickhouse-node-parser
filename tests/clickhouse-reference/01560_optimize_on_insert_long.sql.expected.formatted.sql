SELECT *
FROM replacing_merge_tree
ORDER BY key ASC;

SELECT *
FROM collapsing_merge_tree
ORDER BY key ASC;

SELECT *
FROM versioned_collapsing_merge_tree
ORDER BY key ASC;

SELECT *
FROM summing_merge_tree
ORDER BY key ASC;

SELECT *
FROM aggregating_merge_tree
ORDER BY key ASC;

SELECT *
FROM empty
ORDER BY key ASC;

SELECT
    table,
    `partition`,
    active
FROM `system`.parts
WHERE table = 'empty'
    AND active = 1
    AND database = currentDatabase();