select * from system.part_log where database = currentDatabase() and table like 'ttl_02265%' and error != 0 and errorCodeToName(error) != 'NO_REPLICA_HAS_PART';
