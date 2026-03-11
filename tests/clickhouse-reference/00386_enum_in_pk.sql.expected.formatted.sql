SELECT cityHash64(groupArraySorted(100)(x))
FROM enum_pk
WHERE x = '0';

SELECT cityHash64(groupArraySorted(100)(d))
FROM enum_pk
WHERE d = '0';

SELECT cityHash64(groupArraySorted(100)(x))
FROM enum_pk
WHERE x != '0';

SELECT cityHash64(groupArraySorted(100)(d))
FROM enum_pk
WHERE d != '0';

SELECT cityHash64(groupArraySorted(100)(x))
FROM enum_pk
WHERE x = '1';

SELECT cityHash64(groupArraySorted(100)(d))
FROM enum_pk
WHERE d = '1';

SELECT cityHash64(groupArraySorted(100)(x))
FROM enum_pk
WHERE exp2(toInt64(x != '1')) > 1;

SELECT cityHash64(groupArraySorted(100)(d))
FROM enum_pk
WHERE exp2(toInt64(d != '1')) > 1;

SELECT cityHash64(groupArraySorted(100)(x))
FROM enum_pk
WHERE x = toString(0);

SELECT cityHash64(groupArraySorted(100)(d))
FROM enum_pk
WHERE d = toString(0);

SELECT cityHash64(groupArraySorted(100)(x))
FROM enum_pk
WHERE (x = toString(0)) > 0;

SELECT cityHash64(groupArraySorted(100)(d))
FROM enum_pk
WHERE (d = toString(0)) > 0;

SELECT cityHash64(groupArraySorted(100)(x))
FROM enum_pk
WHERE ((x != toString(1)) > 0) > 0;

SELECT cityHash64(groupArraySorted(100)(d))
FROM enum_pk
WHERE ((d != toString(1)) > 0) > 0;

SELECT cityHash64(groupArraySorted(100)(x))
FROM enum_pk
WHERE exp2((x != toString(0)) != 0) > 1;

SELECT cityHash64(groupArraySorted(100)(d))
FROM enum_pk
WHERE exp2((d != toString(0)) != 0) > 1;

SELECT cityHash64(groupArraySorted(100)(x))
FROM enum_pk
WHERE (negate((x != toString(0))) = -1) > 0;

SELECT cityHash64(groupArraySorted(100)(d))
FROM enum_pk
WHERE (negate((d != toString(0))) = -1) > 0;

SELECT cityHash64(groupArraySorted(100)(x))
FROM enum_pk
WHERE 1 = 1;

SELECT cityHash64(groupArraySorted(100)(d))
FROM enum_pk
WHERE 1 = 1;

SELECT cityHash64(groupArraySorted(100)(x))
FROM enum_pk
WHERE (x = '0'
    OR x = '1');

SELECT cityHash64(groupArraySorted(100)(d))
FROM enum_pk
WHERE (d = '0'
    OR d = '1');

SELECT cityHash64(groupArraySorted(100)(x))
FROM enum_pk
WHERE x IN ('0', '1');

SELECT cityHash64(groupArraySorted(100)(d))
FROM enum_pk
WHERE d IN ('0', '1');

SELECT cityHash64(groupArraySorted(100)(x))
FROM enum_pk
WHERE (x != '0'
    AND x != '1');

SELECT cityHash64(groupArraySorted(100)(d))
FROM enum_pk
WHERE (d != '0'
    AND d != '1');