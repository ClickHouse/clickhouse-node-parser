-- With the new analyzer, the REPLACE should apply to WHERE as well,
-- so both rows should be returned (app_id=0 becomes 1, which is != 0).
SELECT * REPLACE (if(app_id = 0, 1, app_id) AS app_id)
FROM t_replace_where
WHERE app_id != 0
ORDER BY app_id ASC;