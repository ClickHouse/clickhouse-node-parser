select CounterID, dummy from merge_distributed where dummy <> '' limit 10;
select CounterID, dummy1 from merge_distributed where dummy1 <> '' limit 10; -- { serverError UNKNOWN_IDENTIFIER }
