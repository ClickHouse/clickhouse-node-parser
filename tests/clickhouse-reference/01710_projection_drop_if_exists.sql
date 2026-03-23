drop table if exists tp;
create table tp (x Int32, y Int32, projection p (select x, y order by x)) engine = MergeTree order by y;
drop table tp;
