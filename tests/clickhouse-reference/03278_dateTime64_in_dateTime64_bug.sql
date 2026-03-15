CREATE TABLE datetime64_issue (id int, dt DateTime64(3), dtn Nullable(DateTime64(3))) ENGINE = MergeTree() ORDER BY id PRIMARY KEY id;
SELECT * FROM datetime64_issue WHERE dt in (toDateTime64('2001-01-11 01:11:21.100', 3));
SELECT * FROM datetime64_issue WHERE dtn in (toDateTime64('2001-01-11 01:11:21.100', 3));
