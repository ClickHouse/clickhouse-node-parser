SELECT count() FROM system.mutations WHERE table = 'bad_conversions' AND database = currentDatabase();
SELECT count() FROM system.mutations WHERE table = 'bad_conversions_2' AND database = currentDatabase();
