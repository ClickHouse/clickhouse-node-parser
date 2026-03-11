SELECT tupleIntDiv((15, 10, 5), (0, 0, 0));

SELECT tupleIntDiv((15, 10, 5), (5, 5, 5));

SELECT tupleIntDiv((15, 10, 5), (5.5, 5.5, 5.5));

SELECT tupleIntDivOrZero((5, 10, 15), (0, 0, 0));

SELECT tupleIntDivByNumber((15, 10, 5), 0);

SELECT tupleIntDivByNumber((15, 10, 5), 5);

SELECT tupleIntDivByNumber((15.2, 10.7, 5.5), 5.8);

SELECT tupleIntDivOrZeroByNumber((15, 10, 5), 5);

SELECT tupleIntDivOrZeroByNumber((15, 10, 5), 0);

SELECT tupleModulo((15, 10, 5), (0, 3, 2));

SELECT tupleModulo((15, 10, 5), (5, 3, 2));

SELECT tupleModuloByNumber((15, 10, 5), 0);

SELECT tupleModuloByNumber((15, 10, 5), 2);