create table nested_smt (
     date date,
     val UInt64,
     counters_Map Nested (
         id UInt8,
         count Int32
     )
)
ENGINE = SummingMergeTree()
ORDER BY (date);
-- { echo }
select * from nested_smt order by val;
select * from nested_smt final;
select * from nested_smt;
