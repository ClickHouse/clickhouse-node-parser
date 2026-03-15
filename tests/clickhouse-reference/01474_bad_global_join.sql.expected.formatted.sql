CREATE TABLE local_table
(
    id UInt64,
    val String
)
ENGINE = Memory;

CREATE TABLE dist_table AS local_table
ENGINE = Distributed('test_cluster_two_shards_localhost', currentDatabase(), local_table);

SELECT uniq(d.val)
FROM
    dist_table AS d
LEFT JOIN numbers(100) AS t
    USING (id); -- { serverError UNKNOWN_IDENTIFIER, 284 }

SELECT uniq(d.val)
FROM
    dist_table AS d
LEFT JOIN local_table AS t
    USING (id);