SELECT *
FROM (
        SELECT
            number,
            'payload'
        FROM numbers(2000000)
    )
ORDER BY number ASC
SETTINGS
    log_comment = '03772_temporary_files_codec/sort',
    temporary_files_codec = 'NONE'
FORMAT Null;

SELECT *
FROM (
        SELECT
            number,
            'payload'
        FROM numbers(2000000)
    )
ORDER BY number ASC
SETTINGS
    log_comment = '03772_temporary_files_codec/sort',
    temporary_files_codec = 'LZ4'
FORMAT Null;

SELECT
    key,
    sum(val)
FROM (
        SELECT
            number AS key,
            number AS val
        FROM numbers(2000000)
    )
GROUP BY key
SETTINGS
    log_comment = '03772_temporary_files_codec/agg',
    temporary_files_codec = 'NONE'
FORMAT Null;

SELECT
    key,
    sum(val)
FROM (
        SELECT
            number AS key,
            number AS val
        FROM numbers(2000000)
    )
GROUP BY key
SETTINGS
    log_comment = '03772_temporary_files_codec/agg',
    temporary_files_codec = 'LZ4'
FORMAT Null;

SELECT *
FROM
    (
        SELECT
            number AS key,
            number AS val
        FROM numbers(200000)
    ) AS t1
INNER JOIN (
        SELECT number AS key
        FROM numbers(200000)
    ) AS t2
    USING (key)
SETTINGS
    log_comment = '03772_temporary_files_codec/grace_join',
    temporary_files_codec = 'NONE'
FORMAT Null;

SELECT *
FROM
    (
        SELECT
            number AS key,
            number AS val
        FROM numbers(200000)
    ) AS t1
INNER JOIN (
        SELECT number AS key
        FROM numbers(200000)
    ) AS t2
    USING (key)
SETTINGS
    log_comment = '03772_temporary_files_codec/grace_join',
    temporary_files_codec = 'LZ4'
FORMAT Null;

SELECT *
FROM
    (
        SELECT
            number AS key,
            number AS val
        FROM numbers(200000)
    ) AS t1
INNER JOIN (
        SELECT number AS key
        FROM numbers(200000)
    ) AS t2
    USING (key)
SETTINGS
    log_comment = '03772_temporary_files_codec/partial_merge_join',
    temporary_files_codec = 'NONE'
FORMAT Null;

SELECT *
FROM
    (
        SELECT
            number AS key,
            number AS val
        FROM numbers(200000)
    ) AS t1
INNER JOIN (
        SELECT number AS key
        FROM numbers(200000)
    ) AS t2
    USING (key)
SETTINGS
    log_comment = '03772_temporary_files_codec/partial_merge_join',
    temporary_files_codec = 'LZ4'
FORMAT Null;

SELECT
    log_comment,
    ((sumIf(ProfileEvents['ExternalProcessingCompressedBytesTotal'], `Settings`['temporary_files_codec'] = 'LZ4') AS with_compression)) > 0,
    ((sumIf(ProfileEvents['ExternalProcessingUncompressedBytesTotal'], `Settings`['temporary_files_codec'] = 'NONE') AS without_compression)) > 0,
    with_compression < without_compression
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND event_time >= (
        SELECT ts
        FROM start_ts
    )
    AND current_database = currentDatabase()
    AND type != 1
    AND like(log_comment, '03772_temporary_files_codec/%')
GROUP BY log_comment
ORDER BY log_comment ASC;