SELECT id, data, _size, _file, _path FROM s3(s3_conn, filename='03036_archive2.zip :: example*.csv') ORDER BY (id, _file, _path);
SELECT id, data, _size, _file, _path FROM s3Cluster('test_cluster_two_shards', s3_conn, filename='03036_archive2.zip :: example*.csv') ORDER BY (id, _file, _path);
SELECT id, data, _size, _file, _path FROM s3(s3_conn, filename='03036_archive*.zip :: example*.csv') ORDER BY (id, _file, _path);
SELECT id, data, _size, _file, _path FROM s3Cluster('test_cluster_two_shards', s3_conn, filename='03036_archive*.zip :: example*.csv') ORDER BY (id, _file, _path);
