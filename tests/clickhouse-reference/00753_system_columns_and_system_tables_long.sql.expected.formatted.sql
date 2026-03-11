SELECT
    name,
    partition_key,
    sorting_key,
    primary_key,
    sampling_key,
    storage_policy,
    total_rows
FROM `system`.tables
WHERE name = 'check_system_tables'
    AND database = currentDatabase()
FORMAT PrettyCompactNoEscapes;

SELECT
    name,
    is_in_partition_key,
    is_in_sorting_key,
    is_in_primary_key,
    is_in_sampling_key
FROM `system`.`columns`
WHERE table = 'check_system_tables'
    AND database = currentDatabase()
FORMAT PrettyCompactNoEscapes;

SELECT
    total_bytes_uncompressed,
    total_bytes,
    total_rows
FROM `system`.tables
WHERE name = 'check_system_tables'
    AND database = currentDatabase();

SELECT
    name,
    partition_key,
    sorting_key,
    primary_key,
    sampling_key
FROM `system`.tables
WHERE name = 'check_system_tables'
    AND database = currentDatabase()
FORMAT PrettyCompactNoEscapes;

SELECT
    total_bytes,
    total_rows
FROM `system`.tables
WHERE name = 'check_system_tables'
    AND database = currentDatabase();

SELECT
    lifetime_bytes,
    lifetime_rows
FROM `system`.tables
WHERE name = 'check_system_tables'
    AND database = currentDatabase();

SELECT
    and(greaterOrEquals(total_bytes, 5000), lessOrEquals(total_bytes, 15000)),
    total_rows
FROM `system`.tables
WHERE name = 'check_system_tables'
    AND database = currentDatabase();

SELECT
    total_bytes_uncompressed,
    total_bytes,
    total_rows
FROM `system`.tables
WHERE name = 'check_system_tables_mv'
    AND database = currentDatabase();

SELECT
    total_bytes_uncompressed > 0,
    total_bytes > 0,
    total_rows
FROM `system`.tables
WHERE name = 'check_system_tables_mv'
    AND database = currentDatabase();