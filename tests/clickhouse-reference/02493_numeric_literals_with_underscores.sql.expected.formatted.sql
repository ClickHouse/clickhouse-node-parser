SELECT 1234; -- Positive integer (+ implied)

SELECT 1234;

SELECT 1234;

SELECT 1234; -- Positive integer (+ explicit)

SELECT 1234;

SELECT 1234;

SELECT -1234; -- Negative integer

SELECT -1234;

SELECT -1234;

SELECT 12.34; -- Positive floating point with . notation

SELECT 12.34;

SELECT 12.34;

SELECT 12.34;

SELECT -12.34; -- Negative floating point with . notation

SELECT -12.34;

SELECT -12.34;

SELECT -12.34;

SELECT 34e21; -- Positive floating point with positive scientific notation (+ implied)

SELECT 34e21;

SELECT 34e21;

SELECT 34e21;

SELECT 34e+21; -- Positive floating point with positive scientific notation (+ explicit)

SELECT 34e+21;

SELECT 34e+21;

SELECT 34e+21;

SELECT 34e-21; -- Positive floating point with negative scientific notation

SELECT 34e-21;

SELECT 34e-21;

SELECT 34e-21;

SELECT -34e21; -- Negative floating point with positive scientific notation (+ implied)

SELECT -34e21;

SELECT -34e21;

SELECT -34e21;

SELECT -34e+21; -- Negative floating point with positive scientific notation (+ explicit)

SELECT -34e+21;

SELECT -34e+21;

SELECT -34e+21;

SELECT -34e-21; -- Negative floating point with negative scientific notation

SELECT -34e-21;

SELECT -34e-21;

SELECT -34e-21;

SELECT 1.34e21; -- Positive floating point (with .) with positive scientific notation (+ implied)

SELECT 1.34e21;

SELECT 1.34e21;

SELECT 1.34e21;

SELECT 1.34e+21; -- Positive floating point (with .) with positive scientific notation (+ explicit)

SELECT 1.34e+21;

SELECT 1.34e+21;

SELECT 1.34e+21;

SELECT 1.34e-21; -- Positive floating point (with .) with negative scientific notation

SELECT 1.34e-21;

SELECT 1.34e-21;

SELECT 1.34e-21;

SELECT -1.34e21; -- Negative floating point (with .) with positive scientific notation (+ implied)

SELECT -1.34e21;

SELECT -1.34e21;

SELECT -1.34e21;

SELECT -1.34e+21; -- Negative floating point (with .) with positive scientific notation (+ explicit)

SELECT -1.34e+21;

SELECT -1.34e+21;

SELECT -1.34e+21;

SELECT -1.34e-21; -- Negative floating point (with .) with negative scientific notation

SELECT -1.34e-21;

SELECT -1.34e-21;

SELECT -1.34e-21;

SELECT -.34e21; -- Negative floating point (with .) with positive scientific notation (+ implied)

SELECT -.34e21;

SELECT -.34e21;

SELECT -.34e21;

SELECT -.34e+21; -- Negative floating point (with .) with positive scientific notation (+ explicit)

SELECT -.34e+21;

SELECT -.34e+21;

SELECT -.34e+21;

SELECT -.34e-21; -- Negative floating point (with .) with negative scientific notation

SELECT -.34e-21;

SELECT -.34e-21;

SELECT -.34e-21;

SELECT nan; -- Specials

SELECT inf;

SELECT inf;

SELECT -inf;

SELECT 0b1111; -- Binary

SELECT 0b1111;

SELECT 0b1111;

SELECT -15;

SELECT -15;

SELECT -15;

SELECT 0x1234; -- Hex

SELECT 0x1234;

SELECT 0x1234;

SELECT -4660;

SELECT -4660;

SELECT -4660;

SELECT 0xee;

SELECT 0xee;

SELECT 0x1.234; -- Hex fractions

SELECT 0x1.2_3_4;

SELECT -0x1.234;

SELECT -0x1.2_3_4;

SELECT 0x0.ee;

SELECT 0x0.e_e;

SELECT 0x1.234p01; -- Hex scientific notation

SELECT 0x1.2_34p01;

SELECT 0x1.234p0_1;

SELECT 0x1.234p+01;

SELECT 0x1.2_34p+01;

SELECT 0x1.2_34p+0_1;

SELECT 0x1.234p-01;

SELECT 0x1.2_34p-01;

SELECT 0x1.2_34p-0_1;

SELECT -0x1.234p01;

SELECT -0x1.2_34p01;

SELECT -0x1.2_34p0_1;

SELECT -0x1.234p+01;

SELECT -0x1.2_34p+01;

SELECT -0x1.2_34p+0_1;

SELECT -0x1.234p-01;

SELECT -0x1.2_34p-01;

SELECT -0x1.2_34p-0_1;

-- Things that are not a number
SELECT _1000; -- { serverError UNKNOWN_IDENTIFIER }

SELECT _1000
FROM (
        SELECT 1 AS _1000
    )
FORMAT Null;

SELECT negate(_1); -- { serverError UNKNOWN_IDENTIFIER }

SELECT negate(_1)
FROM (
        SELECT -1 AS _1
    )
FORMAT Null;

SELECT _1; -- { serverError UNKNOWN_IDENTIFIER }

SELECT `1__0`; -- { serverError UNKNOWN_IDENTIFIER }

SELECT `1_`; -- { serverError UNKNOWN_IDENTIFIER }

SELECT `10_`; -- { serverError UNKNOWN_IDENTIFIER }

SELECT `1_e5`; -- { serverError UNKNOWN_IDENTIFIER }

SELECT `1e_5`; -- { serverError UNKNOWN_IDENTIFIER }

SELECT `1e5_`; -- { serverError UNKNOWN_IDENTIFIER }

SELECT `1e_`; -- { serverError UNKNOWN_IDENTIFIER }

SELECT `1e_1`; -- { serverError UNKNOWN_IDENTIFIER }

SELECT `0_x2`; -- { serverError UNKNOWN_IDENTIFIER }

SELECT `0x2_p2`; -- { serverError UNKNOWN_IDENTIFIER }

SELECT `0x2p_2`; -- { serverError UNKNOWN_IDENTIFIER }

SELECT `0x2p2_`; -- { serverError UNKNOWN_IDENTIFIER }

SELECT `0b`; -- { serverError UNKNOWN_IDENTIFIER }

SELECT `0x`; -- { serverError UNKNOWN_IDENTIFIER }

SELECT `0x_`; -- { serverError UNKNOWN_IDENTIFIER }

SELECT `0x_1`; -- { serverError UNKNOWN_IDENTIFIER }