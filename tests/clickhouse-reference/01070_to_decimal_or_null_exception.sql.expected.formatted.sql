SELECT toDecimal32('e', 1);

SELECT toDecimal64('e', 2);

SELECT toDecimal128('e', 3);

SELECT
    toDecimal32OrNull('e', 1) AS x,
    isNull(x);

SELECT
    toDecimal64OrNull('e', 2) AS x,
    isNull(x);

SELECT
    toDecimal128OrNull('e', 3) AS x,
    isNull(x);