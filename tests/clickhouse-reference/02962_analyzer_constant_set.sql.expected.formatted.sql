SELECT sum(z)
FROM test_parallel_index
WHERE z = 2
    OR z = 7
    OR z = 13
    OR z = 17
    OR z = 19
    OR z = 23;