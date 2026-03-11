SELECT
    count(),
    dynamicType(d)
FROM test
GROUP BY dynamicType(d)
ORDER BY
    count() ASC,
    dynamicType(d) ASC;