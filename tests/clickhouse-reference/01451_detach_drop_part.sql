SELECT v FROM mt_01451 ORDER BY v;
SELECT name FROM system.detached_parts WHERE table = 'mt_01451' AND database = currentDatabase();
SELECT '-- drop part --';
SELECT name FROM system.parts WHERE table = 'mt_01451' AND active AND database = currentDatabase();
