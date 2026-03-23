-- Tags: no-fasttest
-- Tag no-fasttest: needs s3
INSERT INTO FUNCTION s3('http://localhost:9001/foo/test_{_partition_id}.csv', 'admin', 'admin', 'CSV', 'id Int32, val String') PARTITION BY val; -- { serverError CANNOT_PARSE_TEXT }

INSERT INTO FUNCTION s3('http://localhost:9001/foo/test_{_partition_id}.csv', 'admin', 'admin', 'CSV', 'id Int32, val String') PARTITION BY val; -- { serverError CANNOT_PARSE_TEXT }

INSERT INTO FUNCTION s3('http://localhost:9001/foo/test_{_partition_id}.csv', 'admin', 'admin', 'CSV', 'id Int32, val String') PARTITION BY val; -- { serverError CANNOT_PARSE_TEXT }

INSERT INTO FUNCTION s3('http://localhost:9001/foo/test_{_partition_id}.csv', 'admin', 'admin', 'CSV', 'id Int32, val String') PARTITION BY val; -- { serverError CANNOT_PARSE_TEXT }

INSERT INTO FUNCTION s3('http://localhost:9001/foo/test_{_partition_id}.csv', 'admin', 'admin', 'CSV', 'id Int32, val String') PARTITION BY val; -- { serverError CANNOT_PARSE_TEXT }

INSERT INTO FUNCTION s3('http://localhost:9001/foo/{_partition_id}', 'admin', 'admin', 'CSV', 'id Int32, val String') PARTITION BY val; -- { serverError BAD_ARGUMENTS }