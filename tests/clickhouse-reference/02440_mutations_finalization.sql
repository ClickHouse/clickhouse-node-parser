select mutation_id, command, parts_to_do_names, is_done from system.mutations where database=currentDatabase() and table='mut';
select sleepEachRow(2) as higher_probablility_of_reproducing_the_issue format Null;
-- mutation should not be finished yet
select * from mut;
select mutation_id, command, parts_to_do_names from system.mutations where database=currentDatabase() and table='mut';
