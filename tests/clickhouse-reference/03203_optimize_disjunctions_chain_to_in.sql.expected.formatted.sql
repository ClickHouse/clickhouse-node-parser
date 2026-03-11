SELECT *
FROM foo
WHERE (foo.i = parseDateTimeBestEffort('2020-01-01'))
    OR (foo.i = parseDateTimeBestEffort('2020-01-02'))
    OR (foo.i = parseDateTimeBestEffort('2020-01-03'))
ORDER BY foo.i ASC;