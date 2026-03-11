SELECT icebergTruncate(10, 0);

SELECT icebergTruncate(10, 1);

SELECT icebergTruncate(10, 5);

SELECT icebergTruncate(10, 9);

SELECT icebergTruncate(10, 10);

SELECT icebergTruncate(10, 11);

SELECT icebergTruncate(10, -1);

SELECT icebergTruncate(10, -5);

SELECT icebergTruncate(10, -10);

SELECT icebergTruncate(10, -11);

SELECT icebergTruncate(10, 0::Int64);

SELECT icebergTruncate(10, 1::Int64);

SELECT icebergTruncate(10, 5::Int64);

SELECT icebergTruncate(10, 9::Int64);

SELECT icebergTruncate(10, 10::Int64);

SELECT icebergTruncate(10, 11::Int64);

SELECT icebergTruncate(10, -1::Int64);

SELECT icebergTruncate(10, -5::Int64);

SELECT icebergTruncate(10, -10::Int64);

SELECT icebergTruncate(10, -11::Int64);

SELECT icebergTruncate(10, toDecimal64('12.34', 2));

SELECT icebergTruncate(10, toDecimal64('12.30', 2));

SELECT icebergTruncate(10, toDecimal64('12.29', 2));

SELECT icebergTruncate(10, toDecimal64('0.05', 2));

SELECT icebergTruncate(10, toDecimal64('-0.05', 2));

SELECT icebergTruncate(10, toDecimal32('12.34', 2));

SELECT icebergTruncate(10, toDecimal32('12.30', 2));

SELECT icebergTruncate(10, toDecimal32('12.29', 2));

SELECT icebergTruncate(10, toDecimal32('0.05', 2));

SELECT icebergTruncate(10, toDecimal32('-0.05', 2));

SELECT icebergTruncate(5, 'abcdefg');

SELECT icebergTruncate(5, 'abc');

SELECT icebergTruncate(5, 'abcde');

SELECT icebergTruncate(5, toFixedString('abcdefg', 30));

SELECT icebergTruncate(5, toFixedString('abc', 3));

SELECT icebergTruncate(5, toFixedString('abcde', 5));

SELECT icebergTruncate(0, 55);

SELECT icebergTruncate(-1, 55);

SELECT icebergTruncate(3, 0.0);

SELECT icebergTruncate(50, toDecimal64('10.65', 2));

SELECT icebergTruncate(3, 'iceberg');