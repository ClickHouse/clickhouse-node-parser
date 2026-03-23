-- datatable(a: int, b: dynamic, c: dynamic, d: dynamic) [
--    1, dynamic(['Salmon', 'Steak', 'Chicken']), dynamic([1, 2, 3, 4]), dynamic([5, 6, 7, 8])
-- ]
SYSTEM DROP  TABLE IF EXISTS mv_expand_test_table;

CREATE TABLE mv_expand_test_table
(
    a UInt8,
    b Array(String),
    c Array(Int8),
    d Array(Int8)
)
ENGINE = Memory;

INSERT INTO mv_expand_test_table;

SET allow_experimental_kusto_dialect = 1;

SET dialect = 'kusto';

SET max_query_size = 28;

SET max_query_size = 262144;