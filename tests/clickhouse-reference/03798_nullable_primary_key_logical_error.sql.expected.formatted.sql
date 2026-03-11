SELECT DISTINCT minDistinct(toDecimalString(isNotNull(77), isZeroOrNull(isNotNull(toNullable(1)))))
FROM t;