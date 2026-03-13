SELECT
    least(toInt8(127), toInt128(0)) AS x,
    least(toInt8(127), toInt128(128)) AS x2,
    least(toInt8(-128), toInt128(0)) AS x3,
    least(toInt8(-128), toInt128(-129)) AS x4,
    greatest(toInt8(127), toInt128(0)) AS y,
    greatest(toInt8(127), toInt128(128)) AS y2,
    greatest(toInt8(-128), toInt128(0)) AS y3,
    greatest(toInt8(-128), toInt128(-129)) AS y4,
    toTypeName(x),
    toTypeName(y);

SELECT
    least(toInt8(127), toInt256(0)) AS x,
    least(toInt8(127), toInt256(128)) AS x2,
    least(toInt8(-128), toInt256(0)) AS x3,
    least(toInt8(-128), toInt256(-129)) AS x4,
    greatest(toInt8(127), toInt256(0)) AS y,
    greatest(toInt8(127), toInt256(128)) AS y2,
    greatest(toInt8(-128), toInt256(0)) AS y3,
    greatest(toInt8(-128), toInt256(-129)) AS y4,
    toTypeName(x),
    toTypeName(y);

SELECT
    least(toInt64(9223372036854775807), toInt128(0)) AS x,
    least(toInt64(9223372036854775807), toInt128('9223372036854775808')) AS x2,
    least(toInt64(-9223372036854775808), toInt128(0)) AS x3,
    least(toInt64(-9223372036854775808), toInt128('-9223372036854775809')) AS x4,
    greatest(toInt64(9223372036854775807), toInt128(0)) AS y,
    greatest(toInt64(9223372036854775807), toInt128('9223372036854775808')) AS y2,
    greatest(toInt64(-9223372036854775808), toInt128(0)) AS y3,
    greatest(toInt64(-9223372036854775808), toInt128('-9223372036854775809')) AS y4,
    toTypeName(x),
    toTypeName(y);

SELECT
    least(toInt64(9223372036854775807), toInt256(0)) AS x,
    least(toInt64(9223372036854775807), toInt256('9223372036854775808')) AS x2,
    least(toInt64(-9223372036854775808), toInt256(0)) AS x3,
    least(toInt64(-9223372036854775808), toInt256('-9223372036854775809')) AS x4,
    greatest(toInt64(9223372036854775807), toInt256(0)) AS y,
    greatest(toInt64(9223372036854775807), toInt256('9223372036854775808')) AS y2,
    greatest(toInt64(-9223372036854775808), toInt256(0)) AS y3,
    greatest(toInt64(-9223372036854775808), toInt256('-9223372036854775809')) AS y4,
    toTypeName(x),
    toTypeName(y);

SELECT
    least(toUInt8(255), toUInt256(0)) AS x,
    least(toUInt8(255), toUInt256(256)) AS x2,
    greatest(toUInt8(255), toUInt256(0)) AS y,
    greatest(toUInt8(255), toUInt256(256)) AS y2,
    toTypeName(x),
    toTypeName(y);

SELECT
    least(toUInt64('18446744073709551615'), toUInt256(0)) AS x,
    least(toUInt64('18446744073709551615'), toUInt256('18446744073709551616')) AS x2,
    greatest(toUInt64('18446744073709551615'), toUInt256(0)) AS y,
    greatest(toUInt64('18446744073709551615'), toUInt256('18446744073709551616')) AS y2,
    toTypeName(x),
    toTypeName(y);

SELECT
    least(toUInt32(0), toInt256(0)),
    greatest(toInt32(0), toUInt256(0)); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT
    least(toInt32(0), toUInt256(0)),
    greatest(toInt32(0), toUInt256(0)); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }