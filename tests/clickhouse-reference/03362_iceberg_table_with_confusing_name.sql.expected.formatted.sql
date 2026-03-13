-- Tags: no-fasttest
-- Tag no-fasttest: Depends on AWS
SELECT *
FROM icebergS3(s3_conn, filename = 'est')
LIMIT 10;