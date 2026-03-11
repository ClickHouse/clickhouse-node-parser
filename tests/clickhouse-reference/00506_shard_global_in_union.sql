-- Tags: shard

SELECT X FROM (SELECT * FROM (SELECT 1 AS X, 2 AS Y) UNION ALL SELECT 3, 4) ORDER BY X;
SELECT * FROM ( SELECT CounterID FROM remote('127.0.0.2', currentDatabase(), 'globalin') WHERE (CounterID GLOBAL IN ( SELECT toUInt32(34))) GROUP BY CounterID);
SELECT CounterID FROM remote('127.0.0.2', currentDatabase(), 'globalin') WHERE (CounterID GLOBAL IN ( SELECT toUInt32(34) )) GROUP BY CounterID  UNION ALL SELECT CounterID FROM remote('127.0.0.2', currentDatabase(), 'globalin') WHERE (CounterID GLOBAL IN ( SELECT toUInt32(34))) GROUP BY CounterID;
SELECT * FROM ( SELECT CounterID FROM remote('127.0.0.2', currentDatabase(), 'globalin') WHERE (CounterID GLOBAL IN ( SELECT toUInt32(34) )) GROUP BY CounterID  UNION ALL SELECT CounterID FROM remote('127.0.0.2', currentDatabase(), 'globalin') WHERE (CounterID GLOBAL IN ( SELECT toUInt32(34))) GROUP BY CounterID);
SELECT 'finish ===========================;';
SELECT * FROM (
  SELECT * FROM union_bug WHERE Event = 'A'
 UNION ALL
  SELECT * FROM union_bug WHERE Event = 'B'
) ORDER BY Datetime;
SELECT * FROM (
  SELECT Event, Datetime FROM union_bug WHERE Event = 'A'
 UNION ALL
  SELECT * FROM union_bug WHERE Event = 'B'
) ORDER BY Datetime;
SELECT * FROM (
  SELECT * FROM union_bug WHERE Event = 'A'
 UNION ALL
  SELECT Event, Datetime FROM union_bug WHERE Event = 'B'
) ORDER BY Datetime;
SELECT * FROM (
  SELECT Event, Datetime FROM union_bug WHERE Event = 'A'
 UNION ALL
  SELECT Event, Datetime FROM union_bug WHERE Event = 'B'
) ORDER BY Datetime;
