create table test (x UInt32, y String) engine=Memory;
select count() from test;
