create table mt (p int, n int) engine=MergeTree order by tuple() partition by p;
create table m (n int) engine=Memory;
select *, _part from mt order by _part;
select mutation_id, command, parts_to_do_names, parts_to_do, is_done from system.mutations where database=currentDatabase();
select * from mt order by p, n;
