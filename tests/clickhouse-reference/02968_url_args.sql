-- Tags: no-fasttest

create table a (x Int64) engine URL('https://example.com/', CSV, headers('foo' = 'bar', 'a' = '13'));
create table b (x Int64) engine URL('https://example.com/', CSV, headers());
create table c (x Int64) engine S3('https://example.s3.amazonaws.com/a.csv', NOSIGN, CSV, headers('foo' = 'bar'));
create table d (x Int64) engine S3('https://example.s3.amazonaws.com/a.csv', NOSIGN, headers('foo' = 'bar'));
create view e (x Int64) as select count() from url('https://example.com/', CSV, headers('foo' = 'bar', 'a' = '13'));
create view f (x Int64) as select count() from url('https://example.com/', CSV, headers());
create view g (x Int64) as select count() from s3('https://example.s3.amazonaws.com/a.csv', CSV, headers('foo' = 'bar'));
create view h (x Int64) as select count() from s3('https://example.s3.amazonaws.com/a.csv', headers('foo' = 'bar'));
