set allow_deprecated_syntax_for_merge_tree=1;
create table merge_distributed1 ( CounterID UInt32,  StartDate Date,  Sign Int8,  VisitID UInt64,  UserID UInt64,  StartTime DateTime,   ClickLogID UInt64) ENGINE = CollapsingMergeTree(StartDate, intHash32(UserID), tuple(CounterID, StartDate, intHash32(UserID), VisitID, ClickLogID), 8192, Sign);
create table merge_distributed ( CounterID UInt32,  StartDate Date,  Sign Int8,  VisitID UInt64,  UserID UInt64,  StartTime DateTime,   ClickLogID UInt64) ENGINE = Distributed(test_shard_localhost, currentDatabase(), merge_distributed1);
select CounterID, dummy from merge_distributed where dummy <> '' limit 10;
select CounterID, dummy1 from merge_distributed where dummy1 <> '' limit 10; -- { serverError UNKNOWN_IDENTIFIER }
