SELECT name, type, compression_codec FROM system.columns WHERE table='alter_bug' AND database=currentDatabase();
SELECT name, type, default_expression, compression_codec FROM system.columns WHERE table='alter_bug' AND database=currentDatabase();
SELECT * FROM alter_bug;
