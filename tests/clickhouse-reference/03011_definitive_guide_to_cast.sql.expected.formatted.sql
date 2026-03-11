SELECT CAST(123 AS String);

SELECT CAST(1234567890 AS DateTime('Europe/Amsterdam'));

SELECT CAST('[1, 2, 3]' AS Array(UInt8));

SELECT
    CAST(x AS UInt8) AS y,
    toTypeName(y)
FROM VALUES('x Nullable(String)', ('123'), ('NULL'));

SELECT CAST(257 AS UInt8);

SELECT CAST(-1 AS UInt8);

SELECT CAST('[''Hello'', ''wo\\''rld\\\\'']' AS Array(String));

SELECT
    CAST(-123 AS UInt8),
    CAST(1234 AS UInt8);

SELECT CAST('-123' AS UInt8);

SELECT CAST('1234' AS UInt8);

SELECT CAST(' 123' AS UInt8);

SELECT CAST('123 ' AS UInt8);

SELECT CAST('[ 123 ,456, ]' AS Array(UInt16));

SELECT
    CAST(1.9, 'Int64'),
    CAST(-1.9, 'Int64');

SELECT
    [] AS x,
    CAST(x AS Array(Array(Array(Tuple(UInt64, String))))) AS y,
    toTypeName(x),
    toTypeName(y);

SELECT CAST(0 AS DateTime('Europe/Amsterdam'));

SELECT CAST(1234567890.123456 AS DateTime64(6, 'Europe/Amsterdam'));

SELECT CAST(-0.111111 AS DateTime64(6, 'Europe/Amsterdam'));

SELECT CAST(1234567890.123456 AS DateTime('Europe/Amsterdam'));

SELECT CAST(-1 AS DateTime('Europe/Amsterdam'));

SELECT CAST(1e20 AS DateTime64(6, 'Europe/Amsterdam'));

SELECT CAST(1e20 AS DateTime64(9, 'Europe/Amsterdam'));

SELECT CAST(14289 AS Date);

SELECT CAST(1234567890 AS Date);

SELECT CAST('123' AS FixedString(5))
FORMAT TSV;

SELECT CAST('12345' AS FixedString(3))
FORMAT TSV;

SELECT CAST(123, 'String');

SELECT CAST(123, concat('Str', 'ing'));

SELECT CAST(123 AS String);

SELECT CAST(123 AS String);

SELECT CAST(123, String);

SELECT
    'String' AS String,
    CAST(123, String);

SELECT
    _CAST(x, 'UInt8') AS y,
    toTypeName(y)
FROM VALUES('x Nullable(String)', ('123'), ('456'));

SELECT _CAST(123 AS UInt8);

SELECT CAST(123 AS UInt8);

SELECT 123::String;

SELECT 1.1::Decimal(30, 20);

SELECT CAST(1.1 AS Decimal(30, 20));

SELECT -1::UInt64;

SELECT CAST(-1 AS UInt64);

SELECT [1.1, 2.3]::Array(Decimal(30, 20));

SELECT [1.1, 2.3 + 0]::Array(Decimal(30, 20));

SELECT
    1.1::Decimal(30, 20),
    CAST('1.1' AS Decimal(30, 20)),
    ((1 + 1))::UInt8
FORMAT Vertical;

SELECT 1 - 1::String;

SELECT -1::String;

SELECT
    1 AS x,
    negate(x::String);

SELECT accurateCast(1.123456789, 'Float32');

SELECT accurateCastOrNull(1.123456789, 'Float32');

SELECT accurateCastOrDefault(-1, 'UInt64', 0::UInt64);

SELECT accurateCastOrDefault(-1, 'UInt64');

SELECT accurateCastOrDefault(-1, 'DateTime');

SELECT ACCURATECAST(1, 'String');

SELECT toUInt8(-1);

SELECT toFloat64(123);

SELECT toFixedString('Hello', 10)
FORMAT TSV;

SELECT toFixedString('Hello', 5 + 5)
FORMAT TSV;

SELECT toDecimal32('123.456', 2);

SELECT toDateTime('2024-04-25 01:02:03', 'Europe/Amsterdam');

SELECT toDateTime64('2024-04-25 01:02:03', 6, 'Europe/Amsterdam');

SELECT toDateTime('2024-04-25 01:02:03');

SELECT toDateTime64('2024-04-25 01:02:03.456789', 6);

SELECT toString(1710612085::DateTime, 'America/Los_Angeles');

SELECT toString(1710612085::DateTime);

SELECT toString(1710612085::DateTime, tz)
FROM Values('tz String', 'Europe/Amsterdam', 'America/Los_Angeles');

SELECT
    toUInt8OrNull('123'),
    toUInt8OrNull('-123'),
    toUInt8OrNull('1234'),
    toUInt8OrNull(' 123');

SELECT
    toUInt8OrZero('123'),
    toUInt8OrZero('-123'),
    toUInt8OrZero('1234'),
    toUInt8OrZero(' 123');

SELECT
    toUInt8OrDefault('123', 10),
    toUInt8OrDefault('-123', 10),
    toUInt8OrDefault('1234', 10),
    toUInt8OrDefault(' 123', 10);

SELECT
    toUInt8OrDefault('123'),
    toUInt8OrDefault('-123'),
    toUInt8OrDefault('1234'),
    toUInt8OrDefault(' 123');

SELECT
    toTypeName(toUInt8OrNull('123')),
    toTypeName(toUInt8OrZero('123'));

SELECT toUInt8OrNull(123);

SELECT toUInt8OrNull(123::FixedString(3));

SELECT toUInt8OrNull('123'::FixedString(4));

SELECT toUInt8OrNull('123\0'::FixedString(4));

SELECT toUInt8OrNull('123\0');

SELECT
    toDate('2024-04-25'),
    toDateTime('2024-01-01 02:03:04'),
    toIntervalMinute(1),
    toIntervalHour(12);

SELECT
    DATE('2024-04-25'),
    TIMESTAMP('2024-01-01 02:03:04'),
    FROM_UNIXTIME(1234567890);

SELECT
    toDate('2024-04-25'),
    timeSTAMP('2024-01-01 02:03:04'),
    From_Unixtime(1234567890);

SELECT parseDateTimeBestEffort('25 Apr 1986 1pm');

SELECT toDayOfMonth(toDateTime(1234567890));