SELECT count()
FROM deltaLake('https://clickhouse-public-datasets.s3.amazonaws.com/delta_lake/hits/', NOSIGN SETTINGS allow_experimental_delta_kernel_rs = 1);