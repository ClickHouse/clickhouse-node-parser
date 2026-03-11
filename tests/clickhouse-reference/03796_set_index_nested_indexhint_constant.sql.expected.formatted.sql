SELECT DISTINCT materialize(toNullable(toUInt256(1)))
FROM tab
WHERE indexHint(indexHint(toUInt128(0)));

SELECT count()
FROM tab
WHERE indexHint(toUInt256(1));

SELECT count()
FROM tab
WHERE indexHint(indexHint(toInt64(1)));