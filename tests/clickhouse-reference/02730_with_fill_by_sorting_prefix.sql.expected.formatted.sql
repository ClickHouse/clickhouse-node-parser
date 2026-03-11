SELECT number
FROM numbers(1)
ORDER BY
    10 ASC,
    number DESC WITH FILL FROM 1
SETTINGS enable_positional_arguments = 0;

SELECT *
FROM ts
ORDER BY
    sensor_id ASC,
    timestamp ASC WITH FILL STEP 1;

SELECT *
FROM ts
ORDER BY
    sensor_id ASC,
    timestamp ASC WITH FILL STEP 1
SETTINGS max_block_size = 2;

SELECT *
FROM ts
ORDER BY
    sensor_id ASC,
    timestamp ASC WITH FILL STEP 1
SETTINGS max_block_size = 3;

SELECT *
FROM ts
ORDER BY
    sensor_id ASC,
    timestamp ASC WITH FILL FROM 6 TO 10 STEP 1 INTERPOLATE (value AS 9999);

SELECT *
FROM ts
ORDER BY
    sensor_id ASC,
    timestamp ASC WITH FILL FROM 6 TO 10 STEP 1 INTERPOLATE (value AS 9999)
SETTINGS use_with_fill_by_sorting_prefix = 0;

SELECT *
FROM ts
ORDER BY
    sensor_id DESC,
    timestamp ASC WITH FILL FROM 6 TO 10 STEP 1 INTERPOLATE (value AS 9999);

SELECT *
FROM ts
ORDER BY
    sensor_id DESC,
    timestamp ASC WITH FILL FROM 6 TO 10 STEP 1 INTERPOLATE (value AS 9999)
SETTINGS use_with_fill_by_sorting_prefix = 0;

SELECT *
FROM ts
ORDER BY
    sensor_id ASC,
    timestamp ASC WITH FILL FROM 6 STEP 1 INTERPOLATE (value AS 9999);

SELECT *
FROM ts
ORDER BY
    sensor_id ASC,
    timestamp ASC WITH FILL FROM 6 STEP 1 INTERPOLATE (value AS 9999)
SETTINGS use_with_fill_by_sorting_prefix = 0;

SELECT *
FROM ts
ORDER BY
    sensor_id DESC,
    timestamp ASC WITH FILL FROM 6 STEP 1 INTERPOLATE (value AS 9999);

SELECT *
FROM ts
ORDER BY
    sensor_id DESC,
    timestamp ASC WITH FILL FROM 6 STEP 1 INTERPOLATE (value AS 9999)
SETTINGS use_with_fill_by_sorting_prefix = 0;

SELECT *
FROM ts
ORDER BY
    sensor_id ASC,
    timestamp ASC WITH FILL TO 10 STEP 1 INTERPOLATE (value AS 9999);

SELECT *
FROM ts
ORDER BY
    sensor_id ASC,
    timestamp ASC WITH FILL TO 10 STEP 1 INTERPOLATE (value AS 9999)
SETTINGS use_with_fill_by_sorting_prefix = 0;

SELECT *
FROM ts
ORDER BY
    sensor_id DESC,
    timestamp ASC WITH FILL TO 10 STEP 1 INTERPOLATE (value AS 9999);

SELECT *
FROM ts
ORDER BY
    sensor_id DESC,
    timestamp ASC WITH FILL TO 10 STEP 1 INTERPOLATE (value AS 9999)
SETTINGS use_with_fill_by_sorting_prefix = 0;

SELECT *
FROM ts
ORDER BY
    sensor_id ASC,
    value ASC,
    timestamp ASC WITH FILL FROM 6 TO 10 INTERPOLATE (value AS 1);