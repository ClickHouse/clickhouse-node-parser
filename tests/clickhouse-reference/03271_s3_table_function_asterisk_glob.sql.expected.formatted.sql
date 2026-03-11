SELECT *
FROM s3(s3_conn, filename = 'dir1/03271_s3_table_function_asterisk_glob/*')
ORDER BY `ALL` ASC
SETTINGS max_threads = 1;

SELECT *
FROM s3(s3_conn, filename = 'dir1/03271_s3_table_function_asterisk_glob/*')
ORDER BY `ALL` ASC
SETTINGS max_threads = 4;

SELECT *
FROM s3Cluster('test_cluster_two_shards_localhost', s3_conn, filename = 'dir1/03271_s3_table_function_asterisk_glob/*')
ORDER BY `ALL` ASC
SETTINGS max_threads = 1;

SELECT *
FROM s3Cluster('test_cluster_two_shards_localhost', s3_conn, filename = 'dir1/03271_s3_table_function_asterisk_glob/*')
ORDER BY `ALL` ASC
SETTINGS max_threads = 4;

SELECT *
FROM s3('https://clickhouse-public-datasets.s3.amazonaws.com/wikistat/original/*', NOSIGN)
LIMIT 1
FORMAT Null;

SELECT *
FROM s3Cluster('test_cluster_two_shards_localhost', 'https://clickhouse-public-datasets.s3.amazonaws.com/wikistat/original/*', NOSIGN)
LIMIT 1
FORMAT Null;