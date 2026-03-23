create table test(day Date, id UInt32) engine=MergeTree partition by day order by tuple();
insert into test select toDate('2023-01-05') AS day, number from numbers(10);
