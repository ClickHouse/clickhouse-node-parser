SELECT count(*) OVER w 
FROM users WINDOW w AS (ORDER BY uid), w AS(ORDER BY name); -- { serverError BAD_ARGUMENTS }
