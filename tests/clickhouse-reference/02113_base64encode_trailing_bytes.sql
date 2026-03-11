SELECT * FROM tabl_1 SETTINGS log_comment = 'ad15a651';
SELECT * FROM tabl_2 SETTINGS log_comment = 'ad15a651';
SELECT base64Decode(base64Encode(normalizeQuery(query)))
    FROM system.query_log
    WHERE type = 'QueryFinish' AND log_comment = 'ad15a651' AND current_database = currentDatabase()
    GROUP BY normalizeQuery(query)
    ORDER BY normalizeQuery(query);
