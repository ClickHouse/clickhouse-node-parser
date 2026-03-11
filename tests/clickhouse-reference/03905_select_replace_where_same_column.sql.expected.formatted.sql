SELECT * REPLACE (if(app_id = 0, 1, app_id) AS app_id)
FROM t_replace_where
WHERE app_id != 0
ORDER BY app_id ASC;