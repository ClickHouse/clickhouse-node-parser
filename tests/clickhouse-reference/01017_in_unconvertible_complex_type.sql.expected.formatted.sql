SELECT (toUInt8(1)) IN (-1);

SELECT (toUInt8(0)) IN (-1);

SELECT (toUInt8(255)) IN (-1);

SELECT [toUInt8(1)] IN ([-1]);

SELECT [toUInt8(0)] IN ([-1]);

SELECT [toUInt8(255)] IN ([-1]);

SELECT (toUInt8(1)) IN ('a');

SELECT [toUInt8(1)] IN (['a']);