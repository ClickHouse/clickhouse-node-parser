SELECT 1
WINDOW w0 AS (ORDER BY min(1) OVER (w0))
SETTINGS allow_experimental_analyzer = 1;

SELECT 1
WINDOW w0 AS (ORDER BY min(1) OVER (w0))
SETTINGS allow_experimental_analyzer = 0;