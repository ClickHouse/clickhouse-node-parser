SELECT *
FROM s3('http://{_partition_id}.s3.region.amazonaws.com/key', 'Parquet');

SELECT *
FROM s3('http://{_partition_id}something.s3.region.amazonaws.com/key', 'Parquet');

SELECT *
FROM s3('http://s3.region.amazonaws.com/{_partition_id}', 'Parquet');

SELECT *
FROM s3('http://s3.region.amazonaws.com/{_partition_id}/key', 'Parquet');

SELECT *
FROM s3('http://bucket.vpce-07a1cd78f1bd55c5f-j3a3vg6w.s3.us-east-1.vpce.amazonaws.com/{_partition_id}', 'Parquet');

SELECT *
FROM s3('http://bucket.vpce-07a1cd78f1bd55c5f-j3a3vg6w.s3.us-east-1.vpce.amazonaws.com/{_partition_id}/key', 'Parquet');