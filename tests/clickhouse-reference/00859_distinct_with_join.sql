create table fooL (a Int32, v String) engine = Memory;
create table fooR (a Int32, v String) engine = Memory;
select distinct a from fooL semi left join fooR using(a) order by a;
