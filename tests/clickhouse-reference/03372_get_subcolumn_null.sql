create table test (x Nullable(UInt32)) engine=Memory;
select getSubcolumn(x, 'null') from test;
