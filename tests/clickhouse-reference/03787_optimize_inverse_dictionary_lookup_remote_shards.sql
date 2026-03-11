SELECT dictGet('inverse_dict_lookup_remote_shards', 'f', dummy) = 12 AS limit_and_equals
FROM remote('localhost,localhost', system.one)
LIMIT 1;
SELECT dictGet('inverse_dict_lookup_remote_shards_composite_key', 'f', tuple(toInt64(dummy), toUInt32(dummy))) = 12 AS limit_and_equals
FROM remote('localhost,localhost', system.one)
LIMIT 1;
