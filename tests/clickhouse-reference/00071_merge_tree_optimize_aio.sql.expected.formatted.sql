SELECT
    EventTime,
    EventDate,
    CounterID,
    UserID,
    URL,
    Referer
FROM hits_snippet
ORDER BY
    EventTime ASC,
    EventDate ASC,
    CounterID ASC,
    UserID ASC,
    URL ASC,
    Referer ASC;