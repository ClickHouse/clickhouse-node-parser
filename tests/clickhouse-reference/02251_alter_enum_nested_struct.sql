SELECT * FROM alter_enum_array ORDER BY Key;
SELECT COUNT() FROM system.mutations where table='alter_enum_array' and database=currentDatabase() and not is_done;
