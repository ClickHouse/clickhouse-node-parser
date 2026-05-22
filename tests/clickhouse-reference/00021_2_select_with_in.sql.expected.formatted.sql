-- Tags: stateful
SELECT sum(Sign)
FROM test.visits
WHERE CounterID IN (942285, 577322);