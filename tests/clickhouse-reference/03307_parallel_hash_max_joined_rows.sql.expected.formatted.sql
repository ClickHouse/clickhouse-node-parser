-- without this limit (i.e. max_joined_block_size_rows=0) consumption is ~8-10G
SELECT *
FROM
    t AS t1
INNER JOIN t AS t2
    ON t1.n = t2.n
FORMAT Null
SETTINGS max_joined_block_size_rows = 65409;