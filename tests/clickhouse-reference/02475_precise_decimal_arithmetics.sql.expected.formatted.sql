SELECT divideDecimal(toDecimal32(0, 2), toDecimal128(11.123456, 6));

SELECT divideDecimal(toDecimal64(123.123, 3), toDecimal64(0, 1));

SELECT multiplyDecimal(toDecimal32(0, 2), toDecimal128(11.123456, 6));

SELECT multiplyDecimal(toDecimal32(123.123, 3), toDecimal128(0, 1));

SELECT multiplyDecimal(toDecimal256(1e38, 0), toDecimal256(1e38, 0));

SELECT divideDecimal(toDecimal256(1e66, 0), toDecimal256(1e-10, 10), 0);

SELECT multiplyDecimal(toDecimal256(1e38, 0), toDecimal256(1e38, 0), 2);

SELECT divideDecimal(toDecimal256(1e72, 0), toDecimal256(1e-5, 5), 2);

SELECT multiplyDecimal(toDecimal256('1e38', 0), toDecimal256('1e38', 0));

SELECT multiplyDecimal(toDecimal256(1e39, 0), toDecimal256(1e39, 0), 0);

SELECT divideDecimal(toDecimal256(1e39, 0), toDecimal256(1e-38, 39));

SELECT divideDecimal(toDecimal128(123.76, 2), toDecimal128(11.123456, 6));

SELECT divideDecimal(toDecimal32(123.123, 3), toDecimal128(11.4, 1), 2);

SELECT divideDecimal(toDecimal128(-123.76, 2), toDecimal128(11.123456, 6));

SELECT divideDecimal(toDecimal32(123.123, 3), toDecimal128(-11.4, 1), 2);

SELECT divideDecimal(toDecimal32(-123.123, 3), toDecimal128(-11.4, 1), 2);

SELECT multiplyDecimal(toDecimal64(123.76, 2), toDecimal128(11.123456, 6));

SELECT multiplyDecimal(toDecimal32(123.123, 3), toDecimal128(11.4, 1), 2);

SELECT multiplyDecimal(toDecimal64(-123.76, 2), toDecimal128(11.123456, 6));

SELECT multiplyDecimal(toDecimal32(123.123, 3), toDecimal128(-11.4, 1), 2);

SELECT multiplyDecimal(toDecimal32(-123.123, 3), toDecimal128(-11.4, 1), 2);

SELECT sum(multiplyDecimal(toDecimal64(number, 1), toDecimal64(number, 5)))
FROM numbers(1000);

SELECT sum(divideDecimal(toDecimal64(number, 1), toDecimal64(number, 5)))
FROM (
        SELECT *
        FROM numbers(1000)
        OFFSET 1
    );

SELECT multiplyDecimal(toNullable(toDecimal64(10, 1)), toDecimal64(100, 5));

SELECT multiplyDecimal(toDecimal64(10, 1), toNullable(toDecimal64(100, 5)));

SELECT multiplyDecimal(toNullable(toDecimal64(10, 1)), toNullable(toDecimal64(100, 5)));

SELECT divideDecimal(toNullable(toDecimal64(10, 1)), toDecimal64(100, 5));

SELECT divideDecimal(toDecimal64(10, 1), toNullable(toDecimal64(100, 5)));

SELECT divideDecimal(toNullable(toDecimal64(10, 1)), toNullable(toDecimal64(100, 5)));