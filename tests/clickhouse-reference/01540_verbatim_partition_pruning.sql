select * from xy where intHash64(x) % 2 = intHash64(2) % 2;
-- Equality is another special operator that can be treated as an always monotonic indicator for deterministic functions.
-- minmax index is not enough.
select * from xy where x = 8;
select * from xyz where y = 2;
select * from test where d != '2020-01-01';
SELECT * FROM myTable mt WHERE myDay = '2021-01-02';
