-- Tags: long
SET max_rows_to_read = 0;
create table test (number UInt64) engine=MergeTree order by number;
select ignore(number) from test where RAND() > 4292390314 limit 10;
select count() > 0 from test where RAND() > 4292390314;
