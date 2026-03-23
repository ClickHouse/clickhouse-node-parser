DROP TABLE IF EXISTS mt;
create table mt (n int, s String) engine=MergeTree order by n;
insert into mt values (1, '');
set allow_nondeterministic_mutations=1;
select distinct n from mt;
DROP TABLE mt;
