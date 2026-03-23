CREATE TABLE t1
(
    date Date, 
    s1 String,
    s2 String
) ENGINE = MergeTree() PARTITION BY toYYYYMMDD(date) ORDER BY (date, s1)
SETTINGS index_granularity = 8192;
insert into t1 (date, s1,s2) values(today()-1,'aaa','bbb');
insert into t1 (date, s1,s2) values(today(),'aaa2','bbb2');
select ignore(date), s3 from t1 where  s2='bbb';
