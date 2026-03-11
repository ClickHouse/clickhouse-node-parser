SELECT _data_lake_snapshot_version
FROM deltaLake('https://clickhouse-public-datasets.s3.amazonaws.com/delta_lake/hits/', NOSIGN)
LIMIT 1;
