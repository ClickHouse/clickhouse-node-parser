-- Tags: no-fasttest
CREATE TABLE a
(
    x Int64
)
ENGINE = URL('https://example.com/', CSV, headers('foo' = 'bar', 'a' = '13'));

CREATE TABLE b
(
    x Int64
)
ENGINE = URL('https://example.com/', CSV, headers());

CREATE TABLE c
(
    x Int64
)
ENGINE = S3('https://example.s3.amazonaws.com/a.csv', NOSIGN, CSV, headers('foo' = 'bar'));

CREATE TABLE d
(
    x Int64
)
ENGINE = S3('https://example.s3.amazonaws.com/a.csv', NOSIGN, headers('foo' = 'bar'));

CREATE VIEW e (x Int64)
AS
SELECT count()
FROM url('https://example.com/', CSV, headers('foo' = 'bar', 'a' = '13'));

CREATE VIEW f (x Int64)
AS
SELECT count()
FROM url('https://example.com/', CSV, headers());

CREATE VIEW g (x Int64)
AS
SELECT count()
FROM s3('https://example.s3.amazonaws.com/a.csv', CSV, headers('foo' = 'bar'));

CREATE VIEW h (x Int64)
AS
SELECT count()
FROM s3('https://example.s3.amazonaws.com/a.csv', headers('foo' = 'bar'));