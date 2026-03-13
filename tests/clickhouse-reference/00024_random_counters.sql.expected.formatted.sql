-- Tags: stateful, no-parallel, no-msan
-- no-parallel: Heavy
SELECT
    uniq(UserID),
    sum(Sign)
FROM test.visits
WHERE CounterID = 32152608;