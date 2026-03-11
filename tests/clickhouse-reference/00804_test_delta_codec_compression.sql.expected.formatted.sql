SELECT floor(big_size / small_size) AS ratio
FROM
    (
        SELECT
            1 AS key,
            sum(bytes_on_disk) AS small_size
        FROM `system`.parts
        WHERE database == currentDatabase()
            AND table == 'delta_codec_synthetic'
            AND active
    )
INNER JOIN (
        SELECT
            1 AS key,
            sum(bytes_on_disk) AS big_size
        FROM `system`.parts
        WHERE database == currentDatabase()
            AND table == 'default_codec_synthetic'
            AND active
    )
    USING (key);

SELECT small_hash == big_hash
FROM
    (
        SELECT
            1 AS key,
            sum(cityHash64(*)) AS small_hash
        FROM delta_codec_synthetic
    )
INNER JOIN (
        SELECT
            1 AS key,
            sum(cityHash64(*)) AS big_hash
        FROM default_codec_synthetic
    )
    USING (key);

SELECT floor(big_size / small_size) AS ratio
FROM
    (
        SELECT
            1 AS key,
            sum(bytes_on_disk) AS small_size
        FROM `system`.parts
        WHERE database = currentDatabase()
            AND table = 'delta_codec_float'
            AND active
    )
INNER JOIN (
        SELECT
            1 AS key,
            sum(bytes_on_disk) AS big_size
        FROM `system`.parts
        WHERE database = currentDatabase()
            AND table = 'default_codec_float'
            AND active
    )
    USING (key);

SELECT small_hash == big_hash
FROM
    (
        SELECT
            1 AS key,
            sum(cityHash64(*)) AS small_hash
        FROM delta_codec_float
    )
INNER JOIN (
        SELECT
            1 AS key,
            sum(cityHash64(*)) AS big_hash
        FROM default_codec_float
    )
    USING (key);

SELECT floor(big_size / small_size) AS ratio
FROM
    (
        SELECT
            1 AS key,
            sum(bytes_on_disk) AS small_size
        FROM `system`.parts
        WHERE database = currentDatabase()
            AND table = 'delta_codec_string'
            AND active
    )
INNER JOIN (
        SELECT
            1 AS key,
            sum(bytes_on_disk) AS big_size
        FROM `system`.parts
        WHERE database = currentDatabase()
            AND table = 'default_codec_string'
            AND active
    )
    USING (key);

SELECT small_hash == big_hash
FROM
    (
        SELECT
            1 AS key,
            sum(cityHash64(*)) AS small_hash
        FROM delta_codec_string
    )
INNER JOIN (
        SELECT
            1 AS key,
            sum(cityHash64(*)) AS big_hash
        FROM default_codec_string
    )
    USING (key);