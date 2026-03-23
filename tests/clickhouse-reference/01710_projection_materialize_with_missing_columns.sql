drop table if exists x;
create table x (i int) engine MergeTree order by tuple();
insert into x values (1);
drop table x;
