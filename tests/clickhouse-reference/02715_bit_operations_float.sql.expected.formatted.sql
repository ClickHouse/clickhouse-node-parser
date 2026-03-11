SELECT
    bitNot(-inf) != 0,
    bitNot(inf) != 0,
    bitNot(3.40282e+38) != 0,
    bitNot(nan) != 0;

SELECT
    bitCount(-inf),
    bitCount(inf),
    bitCount(3.40282e+38),
    bitCount(nan);

SELECT bitAnd(1.0, 1.0);

SELECT bitOr(1.0, 1.0);

SELECT bitRotateLeft(1.0, 1);

SELECT bitShiftLeft(1.0, 1);

SELECT bitTest(1.0, 1);