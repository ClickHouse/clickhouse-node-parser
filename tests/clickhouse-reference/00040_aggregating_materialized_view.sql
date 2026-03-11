SELECT
    StartDate,
    sumMerge(Visits)	AS Visits,
    uniqMerge(Users)	AS Users
FROM basic_00040
GROUP BY StartDate
ORDER BY StartDate;
SELECT
    StartDate,
    sumMerge(Visits)	AS Visits,
    uniqMerge(Users)	AS Users
FROM basic_00040
WHERE CounterID = 942285
GROUP BY StartDate
ORDER BY StartDate;
SELECT
    StartDate,
    sum(Sign) 			AS Visits,
    uniq(UserID)		AS Users
FROM test.visits
WHERE CounterID = 942285
GROUP BY StartDate
ORDER BY StartDate;
