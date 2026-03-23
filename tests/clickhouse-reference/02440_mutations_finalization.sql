-- Tags: no-parallel

create table mut (n int) engine=ReplicatedMergeTree('/test/02440/{database}/mut', '1') order by tuple();
set insert_keeper_fault_injection_probability=0;
insert into mut values (1);
select mutation_id, command, parts_to_do_names, is_done from system.mutations where database=currentDatabase() and table='mut';
-- merges (and mutations) will start again after detach/attach, we need to avoid this somehow...
create table tmp (n int) engine=MergeTree order by tuple() settings index_granularity=1;
insert into tmp select * from numbers(1000);
select sleepEachRow(2) as higher_probablility_of_reproducing_the_issue format Null;
-- mutation should not be finished yet
select * from mut;
select mutation_id, command, parts_to_do_names from system.mutations where database=currentDatabase() and table='mut';
