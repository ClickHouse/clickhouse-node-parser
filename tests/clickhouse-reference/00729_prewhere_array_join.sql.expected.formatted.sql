SELECT arrayJoin(val) AS nameGroup6
FROM t1_00729
PREWHERE notEmpty(toString(nameGroup6))
GROUP BY nameGroup6
ORDER BY nameGroup6 ASC; -- { serverError ILLEGAL_PREWHERE }

SELECT
    arrayJoin(val) AS nameGroup6,
    countDistinct(nid) AS rowids
FROM t1_00729
WHERE notEmpty(toString(nameGroup6))
GROUP BY nameGroup6
ORDER BY nameGroup6 ASC;

SELECT
    arrayJoin(val) AS nameGroup6,
    countDistinct(nid) AS rowids
FROM t1_00729
PREWHERE notEmpty(toString(nameGroup6))
GROUP BY nameGroup6
ORDER BY nameGroup6 ASC; -- { serverError ILLEGAL_PREWHERE }