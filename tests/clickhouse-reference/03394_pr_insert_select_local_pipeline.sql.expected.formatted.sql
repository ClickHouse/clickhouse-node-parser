SELECT
    'mt source table count()',
    count()
FROM t_mt_source;

SELECT '-- check result with local pipeline';

SELECT count()
FROM `system`.query_log
WHERE ((current_database = currentDatabase()
    OR has(databases, currentDatabase())))
    AND type = 'QueryFinish'
    AND query_kind = 'Insert'
    AND log_comment = 'c1fcb43d-1703-4ddb-b353-c8079b405c16'
    AND event_date >= yesterday();

SELECT count()
FROM t_rmt_target;

SELECT *
FROM t_rmt_target
ORDER BY k ASC
EXCEPT
SELECT *
FROM t_mt_source
ORDER BY k ASC;