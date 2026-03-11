SELECT intDivOrZero(0, 0) = 0;

SELECT intDivOrZero(-128, -1) = 0;

SELECT intDivOrZero(-127, -1) = 127;

SELECT intDivOrZero(1, 1) = 1;

SELECT intDivOrZero(4, 2) = 2;