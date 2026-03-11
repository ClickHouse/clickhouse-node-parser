SELECT
    toInt32(-199) % 200 AS k,
    toTypeName(k);

SELECT
    toInt32(-199) % toUInt16(200) AS k,
    toTypeName(k);

SELECT
    toInt32(-199) % toUInt32(200) AS k,
    toTypeName(k);

SELECT
    toInt32(-199) % toUInt64(200) AS k,
    toTypeName(k);

SELECT
    toInt32(-199) % toInt16(-200) AS k,
    toTypeName(k);

SELECT
    199 % -10 AS k,
    toTypeName(k);

SELECT
    199 % -200 AS k,
    toTypeName(k);

SELECT
    toFloat64(-199) % 200 AS k,
    toTypeName(k);

SELECT
    -199 % toFloat64(200) AS k,
    toTypeName(k);