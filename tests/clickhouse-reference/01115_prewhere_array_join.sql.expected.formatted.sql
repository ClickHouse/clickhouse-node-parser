SELECT
    arrayJoin([light]) != 0 AS cond,
    length(heavy)
FROM `prewhere`
WHERE light != 0
    AND cond != 0;

SELECT arrayJoin([0, 1]) AS arrayIdx
FROM testtable
WHERE arrayIdx = 0;