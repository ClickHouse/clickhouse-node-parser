CREATE TABLE t1
(
    date Date, 
    s1 String,
    s2 String
) ENGINE = MergeTree() PARTITION BY toYYYYMMDD(date) ORDER BY (date, s1)
SETTINGS index_granularity = 8192;
select ignore(date), s3 from t1 where  s2='bbb';
