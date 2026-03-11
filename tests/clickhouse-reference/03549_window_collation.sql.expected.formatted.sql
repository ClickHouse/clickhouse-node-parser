SELECT rank() OVER (ORDER BY c0 ASC)
FROM (
        SELECT '1' AS c0
    ) AS v0
QUALIFY rank() OVER (ORDER BY c0 ASC COLLATE 'vi') > 0;

SELECT rank() OVER (ORDER BY c0 ASC COLLATE 'vi')
FROM (
        SELECT '1' AS c0
    ) AS v0
QUALIFY rank() OVER (ORDER BY c0 ASC COLLATE 'vi') > 0;

SELECT rank() OVER (ORDER BY c0 ASC)
FROM (
        SELECT '1' AS c0
    ) AS v0
QUALIFY rank() OVER (ORDER BY c0 ASC) > 0;

SELECT rank() OVER (ORDER BY c0 DESC COLLATE 'vi')
FROM (
        SELECT '1' AS c0
    ) AS v0
QUALIFY rank() OVER (ORDER BY c0 ASC COLLATE 'vi') > 0;