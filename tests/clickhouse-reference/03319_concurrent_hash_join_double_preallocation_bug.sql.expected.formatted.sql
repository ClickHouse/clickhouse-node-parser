SELECT *
FROM
    lhs AS t1
INNER JOIN rhs AS t2
    ON t1.a = t2.a
FORMAT Null;

SELECT *
FROM
    lhs AS t1
INNER JOIN rhs AS t2
    ON t1.a = t2.a
FORMAT Null
SETTINGS log_comment = '03319_second_query';

SELECT ProfileEvents['HashJoinPreallocatedElementsInHashTables']
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND log_comment = '03319_second_query';