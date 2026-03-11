SELECT
    toFixedString('aa', 2) AS a,
    concat(a, a);

SELECT
    toFixedString('aa', 2) AS a,
    length(concat(a, a));

SELECT
    toFixedString('aa', 2) AS a,
    toTypeName(concat(a, a));