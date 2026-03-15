-- Tags: no-fasttest
-- virtual hosted style
CREATE TABLE s3_03364
(
    id UInt32
)
ENGINE = S3('http://{_partition_id}.s3.region.amazonaws.com/key'); -- {serverError BAD_ARGUMENTS}

CREATE TABLE s3_03364
(
    id UInt32
)
ENGINE = S3('http://{_partition_id}something.s3.region.amazonaws.com/key'); -- {serverError BAD_ARGUMENTS}

SELECT *
FROM s3('http://{_partition_id}.s3.region.amazonaws.com/key', 'Parquet'); -- {serverError BAD_ARGUMENTS}

SELECT *
FROM s3('http://{_partition_id}something.s3.region.amazonaws.com/key', 'Parquet'); -- {serverError BAD_ARGUMENTS}

-- path style
CREATE TABLE s3_03364
(
    id UInt32
)
ENGINE = S3('http://s3.region.amazonaws.com/{_partition_id}'); -- {serverError BAD_ARGUMENTS}

CREATE TABLE s3_03364
(
    id UInt32
)
ENGINE = S3('http://s3.region.amazonaws.com/{_partition_id}/key'); -- {serverError BAD_ARGUMENTS}

SELECT *
FROM s3('http://s3.region.amazonaws.com/{_partition_id}', 'Parquet'); -- {serverError BAD_ARGUMENTS}

SELECT *
FROM s3('http://s3.region.amazonaws.com/{_partition_id}/key', 'Parquet'); -- {serverError BAD_ARGUMENTS}

-- aws private link style
CREATE TABLE s3_03364
(
    id UInt32
)
ENGINE = S3('http://bucket.vpce-07a1cd78f1bd55c5f-j3a3vg6w.s3.us-east-1.vpce.amazonaws.com/{_partition_id}'); -- {serverError BAD_ARGUMENTS}

CREATE TABLE s3_03364
(
    id UInt32
)
ENGINE = S3('http://bucket.vpce-07a1cd78f1bd55c5f-j3a3vg6w.s3.us-east-1.vpce.amazonaws.com/{_partition_id}/key'); -- {serverError BAD_ARGUMENTS}

SELECT *
FROM s3('http://bucket.vpce-07a1cd78f1bd55c5f-j3a3vg6w.s3.us-east-1.vpce.amazonaws.com/{_partition_id}', 'Parquet'); -- {serverError BAD_ARGUMENTS}

SELECT *
FROM s3('http://bucket.vpce-07a1cd78f1bd55c5f-j3a3vg6w.s3.us-east-1.vpce.amazonaws.com/{_partition_id}/key', 'Parquet'); -- {serverError BAD_ARGUMENTS}