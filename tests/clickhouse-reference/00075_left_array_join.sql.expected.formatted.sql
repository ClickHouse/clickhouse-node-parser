SELECT
    UserID,
    EventTime::DateTime('Asia/Dubai'),
    pp.Key1,
    pp.Key2,
    ParsedParams.Key1
FROM
    test.hits
ARRAY JOIN ParsedParams AS pp
WHERE CounterID = 1704509
ORDER BY
    UserID ASC,
    EventTime ASC,
    pp.Key1 ASC,
    pp.Key2 ASC
LIMIT 100;

SELECT
    UserID,
    EventTime::DateTime('Asia/Dubai'),
    pp.Key1,
    pp.Key2,
    ParsedParams.Key1
FROM
    test.hits
LEFT ARRAY JOIN ParsedParams AS pp
WHERE CounterID = 1704509
ORDER BY
    UserID ASC,
    EventTime ASC,
    pp.Key1 ASC,
    pp.Key2 ASC
LIMIT 100;