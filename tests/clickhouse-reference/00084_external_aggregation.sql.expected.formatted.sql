SELECT
    URL,
    uniq(SearchPhrase) AS u
FROM test.hits
GROUP BY URL
ORDER BY
    u DESC,
    URL ASC
LIMIT 10;