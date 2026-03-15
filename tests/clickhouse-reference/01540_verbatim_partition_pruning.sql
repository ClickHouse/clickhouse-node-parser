create table xy(x int, y int) engine MergeTree partition by intHash64(x) % 2 order by y settings index_granularity = 1;
-- Now we have two partitions: 0 and 1, each of which contains 2 values.
-- minmax index for the first partition is 0 <= x <= 8
-- minmax index for the second partition is 2 <= x <= 9

SET max_rows_to_read = 2;
select * from xy where intHash64(x) % 2 = intHash64(2) % 2;
-- Equality is another special operator that can be treated as an always monotonic indicator for deterministic functions.
-- minmax index is not enough.
select * from xy where x = 8;
create table xyz(x int, y int, z int) engine MergeTree partition by if(toUInt8(x), y, z) order by x settings index_granularity = 1;
select * from xyz where y = 2;
create table test(d Date, k Int64, s String) Engine=MergeTree partition by (toYYYYMM(d),k) order by (d, k);
select * from test where d != '2020-01-01';
CREATE TABLE myTable (myDay Date, myOrder Int32, someData String) ENGINE = ReplacingMergeTree PARTITION BY floor(toYYYYMMDD(myDay), -1) ORDER BY (myOrder);
SELECT * FROM myTable mt WHERE myDay = '2021-01-02';
