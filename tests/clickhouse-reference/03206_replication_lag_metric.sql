SELECT replication_lag FROM system.clusters WHERE cluster IN ('rdb1', 'rdb2') ORDER BY cluster ASC, replica_num ASC;
