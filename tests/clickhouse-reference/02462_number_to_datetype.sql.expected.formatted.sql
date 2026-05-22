-- { echoOn }
-- toDate
SELECT
    toYYYYMMDD(toDate(recordTimestamp, 'Europe/Amsterdam')),
    toDate(recordTimestamp, 'Europe/Amsterdam'),
    toInt64(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDate(recordTimestamp, 'Europe/Amsterdam')),
    toDate(recordTimestamp, 'Europe/Amsterdam'),
    toUInt64(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDate(recordTimestamp, 'Europe/Amsterdam')),
    toDate(recordTimestamp, 'Europe/Amsterdam'),
    toInt32(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDate(recordTimestamp, 'Europe/Amsterdam')),
    toDate(recordTimestamp, 'Europe/Amsterdam'),
    toUInt32(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDate(recordTimestamp, 'Europe/Amsterdam')),
    toDate(recordTimestamp, 'Europe/Amsterdam'),
    toFloat32(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDate(recordTimestamp, 'Europe/Amsterdam')),
    toDate(recordTimestamp, 'Europe/Amsterdam'),
    toFloat64(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

-- toDate32
SELECT
    toYYYYMMDD(toDate32(recordTimestamp, 'Europe/Amsterdam')),
    toDate32(recordTimestamp, 'Europe/Amsterdam'),
    toInt64(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDate32(recordTimestamp, 'Europe/Amsterdam')),
    toDate32(recordTimestamp, 'Europe/Amsterdam'),
    toUInt64(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDate32(recordTimestamp, 'Europe/Amsterdam')),
    toDate32(recordTimestamp, 'Europe/Amsterdam'),
    toInt32(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDate32(recordTimestamp, 'Europe/Amsterdam')),
    toDate32(recordTimestamp, 'Europe/Amsterdam'),
    toUInt32(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDate32(recordTimestamp, 'Europe/Amsterdam')),
    toDate32(recordTimestamp, 'Europe/Amsterdam'),
    toFloat32(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDate32(recordTimestamp, 'Europe/Amsterdam')),
    toDate32(recordTimestamp, 'Europe/Amsterdam'),
    toFloat64(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

-- toDateTime
SELECT
    toYYYYMMDD(toDateTime(recordTimestamp, 'Europe/Amsterdam')),
    toDateTime(recordTimestamp, 'Europe/Amsterdam'),
    toInt64(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDateTime(recordTimestamp, 'Europe/Amsterdam')),
    toDateTime(recordTimestamp, 'Europe/Amsterdam'),
    toUInt64(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDateTime(recordTimestamp, 'Europe/Amsterdam')),
    toDateTime(recordTimestamp, 'Europe/Amsterdam'),
    toInt32(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDateTime(recordTimestamp, 'Europe/Amsterdam')),
    toDateTime(recordTimestamp, 'Europe/Amsterdam'),
    toUInt32(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDateTime(recordTimestamp, 'Europe/Amsterdam')),
    toDateTime(recordTimestamp, 'Europe/Amsterdam'),
    toFloat32(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDateTime(recordTimestamp, 'Europe/Amsterdam')),
    toDateTime(recordTimestamp, 'Europe/Amsterdam'),
    toFloat64(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

-- toDateTime64
SELECT
    toYYYYMMDD(toDateTime64(recordTimestamp, 3, 'Europe/Amsterdam')),
    toDateTime64(recordTimestamp, 3, 'Europe/Amsterdam'),
    toInt64(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDateTime64(recordTimestamp, 3, 'Europe/Amsterdam')),
    toDateTime64(recordTimestamp, 3, 'Europe/Amsterdam'),
    toUInt64(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDateTime64(recordTimestamp, 3, 'Europe/Amsterdam')),
    toDateTime64(recordTimestamp, 3, 'Europe/Amsterdam'),
    toInt32(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDateTime64(recordTimestamp, 3, 'Europe/Amsterdam')),
    toDateTime64(recordTimestamp, 3, 'Europe/Amsterdam'),
    toUInt32(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDateTime64(recordTimestamp, 3, 'Europe/Amsterdam')),
    toDateTime64(recordTimestamp, 3, 'Europe/Amsterdam'),
    toFloat32(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp);

SELECT
    toYYYYMMDD(toDateTime64(recordTimestamp, 3, 'Europe/Amsterdam')),
    toDateTime64(recordTimestamp, 3, 'Europe/Amsterdam'),
    toFloat64(1665519765) AS recordTimestamp,
    toTypeName(recordTimestamp); -- { echoOff }