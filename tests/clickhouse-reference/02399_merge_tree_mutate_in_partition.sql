create table mt (p int, n int) engine=MergeTree order by tuple() partition by p;
create table m (n int) engine=Memory;
insert into mt values (1, 1), (2, 1);
insert into mt values (1, 2), (2, 2);
select *, _part from mt order by _part;
select mutation_id, command, parts_to_do_names, parts_to_do, is_done from system.mutations where database=currentDatabase();
select * from mt order by p, n;
