-- Tags: no-parallel-replicas

select '--------';
SELECT arrayJoin([0, 1, 3, NULL]) AS x,  x = 0,  if(x = 0, 'x=0', 'x<>0') ORDER BY x;
CREATE TABLE mutation_delete_null_rows
(
    `EventDate` Date,
    `CounterID` Nullable(String),
    `UserID` Nullable(UInt32)
)
ENGINE = MergeTree()
ORDER BY EventDate;
SELECT *,UserID = 0 as UserIDEquals0, if(UserID = 0, 'delete', 'leave') as verdict FROM mutation_delete_null_rows ORDER BY EventDate;
SELECT * FROM mutation_delete_null_rows ORDER BY EventDate;
