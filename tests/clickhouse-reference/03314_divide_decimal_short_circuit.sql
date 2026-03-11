SELECT n1, n2, multiIf(n2 != 0, n1 / n2, 0), multiIf(n2 != 0, divideDecimal(n1, n2, 6), 0)
FROM 03314_divide_decimal_short_circuit;
