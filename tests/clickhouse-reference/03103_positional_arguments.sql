-- The query works when using a single SELECT *
SELECT *
FROM
(
    SELECT
        name,
        age
    FROM users
)
GROUP BY
    1,
    2
ORDER BY ALL;
-- It doesn't when the GROUP BY is nested deeper
SELECT *
FROM
(
	SELECT *
	FROM
	(
    	SELECT
        	name,
        	age
    	FROM users
	)
	GROUP BY
    	1,
    	2
)
ORDER BY ALL;
