CREATE TABLE testmt (`CounterID` UInt64, `value` String) ENGINE = MergeTree() ORDER BY CounterID;
SELECT arrayJoin([CounterID NOT IN (2)]) AS counter FROM testmt WHERE CounterID IN (2) GROUP BY counter;
