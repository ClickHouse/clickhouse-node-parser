create table a (i int, j int) engine Log;
create materialized view b engine Log as select countState(*) from a;
select countMerge(*) from b;
