SELECT bitShiftLeft(if(number = NULL, '14342', '4242348'), 1)
FROM numbers(1);

SELECT bitShiftLeft(if(number = NULL, '14342', '4242348'), 1)
FROM numbers(3);

SELECT bitShiftLeft(if(materialize(NULL), '14342', '4242348'), 1)
FROM numbers(1);

SELECT bitShiftLeft(if(materialize(1), '123', '123'), 1)
FROM numbers(1);

SELECT ref_5.pkey AS c_2_c2392_6
FROM t0 AS ref_5
WHERE 'J[' < multiIf(ref_5.pkey IN (
        SELECT 1
    ), bitShiftLeft(multiIf(ref_5.c0 > NULL, '1', ')'), 40), NULL);

SELECT subq_0.pkey AS c_1_c1193_15
FROM t5 AS subq_0
WHERE isNotNull(sipHash128(0, subq_0.c18, bitShiftRight(multiIf(false, (sipHash128(subq_0.pkey, subq_0.c18, 'S')), '1'), 0)));