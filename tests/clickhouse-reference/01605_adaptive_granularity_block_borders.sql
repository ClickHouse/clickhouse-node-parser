SELECT marks FROM system.parts WHERE table = 'adaptive_table' and database=currentDatabase() and active;
SELECT max(length(value)) FROM adaptive_table;
