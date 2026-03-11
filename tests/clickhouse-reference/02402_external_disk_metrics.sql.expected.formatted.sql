SELECT number
FROM (
        SELECT number
        FROM numbers(2097152)
    )
ORDER BY number * 1234567890123456789 ASC
LIMIT 2097142, 10
SETTINGS log_comment = '02402_external_disk_mertrics/sort'
FORMAT Null;

SELECT
    sum(k),
    sum(c)
FROM (
        SELECT
            number AS k,
            sum(number) AS c
        FROM (
                SELECT *
                FROM `system`.numbers
                LIMIT 2097152
            )
        GROUP BY k
    )
SETTINGS log_comment = '02402_external_disk_mertrics/aggregation'
FORMAT Null;

SELECT
    n,
    j * 2097152
FROM
    (
        SELECT number * 200000 AS n
        FROM numbers(5)
    ) AS nums
LEFT JOIN (
        SELECT
            number * 2 AS n,
            number AS j
        FROM numbers(1000000)
    ) AS js2
    USING (n)
ORDER BY n ASC
SETTINGS log_comment = '02402_external_disk_mertrics/partial_merge_join'
FORMAT Null;

SELECT
    n,
    j * 2097152
FROM
    (
        SELECT number * 200000 AS n
        FROM numbers(5)
    ) AS nums
LEFT JOIN (
        SELECT
            number * 2 AS n,
            number AS j
        FROM numbers(1000000)
    ) AS js2
    USING (n)
ORDER BY n ASC
SETTINGS log_comment = '02402_external_disk_mertrics/grace_join'
FORMAT Null;

SELECT if(any(ProfileEvents['ExternalProcessingFilesTotal']) >= 1
    AND any(ProfileEvents['ExternalProcessingCompressedBytesTotal']) >= 100000
    AND any(ProfileEvents['ExternalProcessingUncompressedBytesTotal']) >= 100000
    AND any(ProfileEvents['ExternalSortWritePart']) >= 1
    AND any(ProfileEvents['ExternalSortMerge']) >= 1
    AND any(ProfileEvents['ExternalSortCompressedBytes']) >= 100000
    AND any(ProfileEvents['ExternalSortUncompressedBytes']) >= 100000
    AND count() == 1, 'ok', concat('fail: ', toString(count()), ' ', toString(any(ProfileEvents))))
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND log_comment = '02402_external_disk_mertrics/sort'
    AND ilike(query, 'SELECT%2097152%')
    AND type = 'QueryFinish';

SELECT if(any(ProfileEvents['ExternalProcessingFilesTotal']) >= 1
    AND any(ProfileEvents['ExternalProcessingCompressedBytesTotal']) >= 100000
    AND any(ProfileEvents['ExternalProcessingUncompressedBytesTotal']) >= 100000
    AND any(ProfileEvents['ExternalAggregationWritePart']) >= 1
    AND any(ProfileEvents['ExternalAggregationMerge']) >= 1
    AND any(ProfileEvents['ExternalAggregationCompressedBytes']) >= 100000
    AND any(ProfileEvents['ExternalAggregationUncompressedBytes']) >= 100000
    AND count() == 1, 'ok', concat('fail: ', toString(count()), ' ', toString(any(ProfileEvents))))
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND log_comment = '02402_external_disk_mertrics/aggregation'
    AND ilike(query, 'SELECT%2097152%')
    AND type = 'QueryFinish';

SELECT if(ProfileEvents['ExternalProcessingFilesTotal'] >= 1
    AND ProfileEvents['ExternalProcessingCompressedBytesTotal'] >= 100000
    AND ProfileEvents['ExternalProcessingUncompressedBytesTotal'] >= 100000
    AND ProfileEvents['ExternalJoinWritePart'] >= 1
    AND ProfileEvents['ExternalJoinMerge'] >= 0
    AND ProfileEvents['ExternalJoinCompressedBytes'] >= 100000
    AND ProfileEvents['ExternalJoinUncompressedBytes'] >= 100000, 'ok', concat('fail: ', toString(ProfileEvents), ' ', log_comment))
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(log_comment, '02402_external_disk_mertrics/%join')
    AND ilike(query, 'SELECT%2097152%')
    AND type = 'QueryFinish';

SELECT
    CurrentMetric_TemporaryFilesForAggregation,
    CurrentMetric_TemporaryFilesForJoin,
    CurrentMetric_TemporaryFilesForSort
FROM `system`.metric_log
ORDER BY event_time DESC
LIMIT 5
FORMAT Null;