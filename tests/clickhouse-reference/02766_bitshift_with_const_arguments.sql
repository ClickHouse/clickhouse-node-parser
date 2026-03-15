SELECT bitShiftLeft(if(number = NULL, '14342', '4242348'), 1) FROM numbers(1);
SELECT bitShiftLeft(if(number = NULL, '14342', '4242348'), 1) FROM numbers(3);
SELECT bitShiftLeft(if(materialize(NULL), '14342', '4242348'), 1) FROM numbers(1);
SELECT bitShiftLeft(if(materialize(1), '123', '123'), 1)  from numbers(1);
CREATE TABLE t0 (vkey UInt32, pkey UInt32, c0 UInt32) engine = TinyLog;
CREATE TABLE t1 (vkey UInt32) ENGINE = AggregatingMergeTree  ORDER BY vkey;
SELECT ref_5.pkey AS c_2_c2392_6 FROM t0 AS ref_5 WHERE 'J[' < multiIf(ref_5.pkey IN ( SELECT 1 ), bitShiftLeft(multiIf(ref_5.c0 > NULL, '1', ')'), 40), NULL);
CREATE TABLE t5 (vkey UInt32, pkey UInt32, c18 Float32, c19 UInt32) ENGINE = Log;
SELECT subq_0.pkey as c_1_c1193_15 FROM t5 AS subq_0 WHERE sipHash128(0, subq_0.c18, bitShiftRight(case when false then (sipHash128(subq_0.pkey, subq_0.c18, 'S')) else '1' end, 0)) is not null;
