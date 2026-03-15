create table mt (n int, s String) engine=MergeTree order by n;
set allow_nondeterministic_mutations=1;
select distinct n from mt;
