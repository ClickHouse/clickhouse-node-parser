-- Tags: no-fasttest, use-hdfs
CREATE TABLE test_02311
(
    x UInt32
)
ENGINE = File(UnknownFormat); -- {serverError UNKNOWN_FORMAT}

CREATE TABLE test_02311
(
    x UInt32
)
ENGINE = URL('http://some/url', UnknownFormat); -- {serverError UNKNOWN_FORMAT}

CREATE TABLE test_02311
(
    x UInt32
)
ENGINE = S3('http://host:2020/test/data', UnknownFormat); -- {serverError UNKNOWN_FORMAT}

CREATE TABLE test_02311
(
    x UInt32
)
ENGINE = HDFS('http://hdfs:9000/data', UnknownFormat); -- {serverError UNKNOWN_FORMAT}