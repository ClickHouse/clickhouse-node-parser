CREATE TABLE sequence
(
    userID UInt64,
    eventType Enum8('A' = 1, 'B' = 2, 'C' = 3, 'D' = 4),
    EventTime UInt64
)
ENGINE = Memory;
SELECT 'ABC'
FROM sequence
GROUP BY userID
HAVING sequenceMatch('(?1).*(?2).*(?3)')(toDateTime(EventTime), eventType = 'A', eventType = 'B', eventType = 'C');
SELECT 'ABA'
FROM sequence
GROUP BY userID
HAVING sequenceMatch('(?1).*(?2).*(?3)')(toDateTime(EventTime), eventType = 'A', eventType = 'B', eventType = 'A');
SELECT 'ABBC'
FROM sequence
GROUP BY userID
HAVING sequenceMatch('(?1).*(?2).*(?3).*(?4)')(EventTime, eventType = 'A', eventType = 'B', eventType = 'B',eventType = 'C');
SELECT 'CD'
FROM sequence
GROUP BY userID
HAVING sequenceMatch('(?1)(?t>=10000000000000)(?2)')(EventTime, eventType = 'C', eventType = 'D');
