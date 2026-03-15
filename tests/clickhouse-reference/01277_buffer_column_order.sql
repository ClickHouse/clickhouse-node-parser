create table out_01277
(
    k1 Int,
    k2 Int,
    a1 Int,
    a2 Int,
    b1 Int,
    b2 Int,
    c  Int
) Engine=Null();
create table buffer_01277 as out_01277 Engine=Buffer(currentDatabase(), out_01277, 1,
    86400, 86400,
    1e5, 1e6,
    10e6, 100e6);
create table in_01277 as out_01277 Engine=Null();
-- differs in order of fields in SELECT clause
create materialized view mv_01277_1 to buffer_01277 as select k1, k2, a1, a2, b1, b2, c from in_01277;
create materialized view mv_01277_2 to buffer_01277 as select a1, a2, k1, k2, b1, b2, c from in_01277;
