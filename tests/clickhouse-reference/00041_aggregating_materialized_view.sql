CREATE TABLE visits_null
(
    CounterID UInt32,
    StartDate Date,
    Sign Int8,
    UserID UInt64
) ENGINE = Null;
set allow_deprecated_syntax_for_merge_tree=1;
CREATE MATERIALIZED VIEW basic
ENGINE = AggregatingMergeTree(StartDate, (CounterID, StartDate), 8192)
AS SELECT
    CounterID,
    StartDate,
    sumState(Sign)                  AS Visits,
    uniqState(UserID)               AS Users
FROM visits_null
GROUP BY CounterID, StartDate;
SELECT
    StartDate,
    sumMerge(Visits)                AS Visits,
    uniqMerge(Users)                AS Users
FROM basic
GROUP BY StartDate
ORDER BY StartDate;
SELECT
    StartDate,
    sumMerge(Visits)                AS Visits,
    uniqMerge(Users)                AS Users
FROM basic
WHERE CounterID = 942285
GROUP BY StartDate
ORDER BY StartDate;
SELECT
    StartDate,
    sum(Sign)                       AS Visits,
    uniq(UserID)                    AS Users
FROM test.visits
WHERE CounterID = 942285
GROUP BY StartDate
ORDER BY StartDate;
