create table h (EventDate Date, CounterID UInt64, WatchID UInt64) engine = MergeTree order by (CounterID, EventDate);
SELECT count() from h ARRAY JOIN [1] AS a PREWHERE WatchID IN (SELECT toUInt64(1)) WHERE (EventDate = '2020-06-10') AND (CounterID = 16671268);
