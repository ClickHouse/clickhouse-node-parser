create table p3 (x Int64, y Int64) engine MergeTree order by (x, y);
insert into p3 values (100, 100);
