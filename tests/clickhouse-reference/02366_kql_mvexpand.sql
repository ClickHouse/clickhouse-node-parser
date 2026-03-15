CREATE TABLE mv_expand_test_table
(    
   a UInt8,
   b Array(String),
   c Array(Int8),
   d Array(Int8)
) ENGINE = Memory;
set allow_experimental_kusto_dialect=1;
set dialect='kusto';
SET max_query_size = 28;
SET max_query_size=262144;
