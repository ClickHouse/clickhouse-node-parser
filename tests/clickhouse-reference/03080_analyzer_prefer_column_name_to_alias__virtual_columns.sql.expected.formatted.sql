SELECT
    any(id),
    any(id) AS id
FROM test
SETTINGS prefer_column_name_to_alias = 1;

SELECT
    any(_sample_factor),
    any(_sample_factor) AS _sample_factor
FROM test
SETTINGS prefer_column_name_to_alias = 1;

SELECT
    any(_partition_id),
    any(_sample_factor),
    any(_partition_id) AS _partition_id,
    any(_sample_factor) AS _sample_factor
FROM test
SETTINGS prefer_column_name_to_alias = 1;