SELECT * FROM empty1 ORDER BY key;
SELECT * FROM empty2 ORDER BY key;
SELECT table, partition, active FROM system.parts where table = 'empty1' and database=currentDatabase() and active = 1;
SELECT table, partition, active FROM system.parts where table = 'empty2' and database=currentDatabase() and active = 1;
