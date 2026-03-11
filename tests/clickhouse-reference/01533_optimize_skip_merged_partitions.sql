SELECT table, partition, active, level from system.parts where table = 'optimize_final' and database = currentDatabase() and active = 1;
