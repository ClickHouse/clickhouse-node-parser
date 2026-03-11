SELECT mapFromArrays([toNullable(toLowCardinality('c')), toFixedString(toFixedString('d', toUInt256(1)), toLowCardinality(1))], map('b', 1, toFixedString('a', 1), 2))
GROUP BY 1;

SELECT '-- Literal tests';

SELECT mapFromArrays([toLowCardinality(toNullable('a')), toLowCardinality(toNullable('b'))], [1, 2])
GROUP BY 1;

SELECT mapFromArrays([toLowCardinality(toNullable(1)), toLowCardinality(toNullable(2))], [3, 4])
GROUP BY 1;

SELECT mapFromArrays([toLowCardinality(toNullable(1)), toLowCardinality(cast(NULL as Nullable(Int32)))], [3, 4])
GROUP BY 1;

SELECT mapFromArrays([toLowCardinality(toNullable('x')), toLowCardinality(cast(NULL as Nullable(String)))], [3, 4])
GROUP BY 1;

SELECT mapFromArrays(k, v)
FROM `03399_lc_nullable_int_simple`;

SELECT mapFromArrays(k, v)
FROM `03399_lc_nullable_int_simple`
GROUP BY 1;

SELECT mapFromArrays(k, v)
FROM `03399_lc_nullable_int_mixed`;

SELECT mapFromArrays(k, v)
FROM `03399_lc_nullable_int_mixed`
GROUP BY 1;

SELECT mapFromArrays(k, v)
FROM `03399_lc_nullable_string_simple`;

SELECT mapFromArrays(k, v)
FROM `03399_lc_nullable_string_simple`
GROUP BY 1;

SELECT mapFromArrays(k, v)
FROM `03399_lc_nullable_string_mixed`;

SELECT mapFromArrays(k, v)
FROM `03399_lc_nullable_string_mixed`
GROUP BY 1;