SELECT *
FROM
    `system`.one
CROSS JOIN `system`.one
SETTINGS
    max_joined_block_size_rows = 0,
    joined_block_split_single_row = 0
FORMAT Null;

SELECT *
FROM
    `system`.one
CROSS JOIN `system`.one
SETTINGS
    max_joined_block_size_rows = 0,
    joined_block_split_single_row = 1
FORMAT Null;