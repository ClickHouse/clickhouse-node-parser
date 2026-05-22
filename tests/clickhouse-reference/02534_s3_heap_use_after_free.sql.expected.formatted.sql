-- Tags: no-fasttest
-- Tag no-fasttest: Depends on AWS
SELECT *
FROM s3('http://localhost:11111/test/a.tsv', CustomSeparated);