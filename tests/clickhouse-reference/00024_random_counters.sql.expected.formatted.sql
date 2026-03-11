SELECT
    uniq(UserID),
    sum(Sign)
FROM test.visits
WHERE CounterID = 32152608;