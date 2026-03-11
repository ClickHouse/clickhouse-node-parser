SELECT
    name,
    value
FROM `system`.`settings`
WHERE tier = 'Experimental'
    AND type = 'Bool'
    AND value != '0'
    AND name NOT IN ('throw_on_unsupported_query_inside_transaction');

SELECT
    name,
    value
FROM `system`.merge_tree_settings
WHERE tier = 'Experimental'
    AND type = 'Bool'
    AND value != '0'
    AND name NOT IN ('remove_rolled_back_parts_immediately');