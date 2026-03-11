SELECT
    'mt source table count()',
    count()
FROM t_mt_source;

SELECT '-- check result without local pipeline';

SELECT count()
FROM `system`.query_log
WHERE ((current_database = currentDatabase()
    OR has(databases, currentDatabase())))
    AND type = 'QueryFinish'
    AND query_kind = 'Insert'
    AND log_comment = 'cb01f13a-410c-4985-b233-35289776b58f'
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