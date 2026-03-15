create table test(str Nullable(String), i Int64) engine=Memory();
select '-----------String------------';
select str, max(i) from test group by str order by str nulls first;
