drop table if exists tp_1;
-- In this test, we are going to create an old part with written projection which does not exist in table metadata
create table tp_1 (x Int32, y Int32, projection p (select x, y order by x)) engine = MergeTree order by y partition by intDiv(y, 100) settings old_parts_lifetime=1;
insert into tp_1 select number, number from numbers(3);
set mutations_sync = 2;
insert into tp_1 select number, number from numbers(4);
-- Now, DROP TABLE triggers part removal
drop table tp_1;
