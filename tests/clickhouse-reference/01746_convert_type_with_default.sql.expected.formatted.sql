SELECT toUInt8OrDefault('1', CAST(2 AS UInt8));

SELECT toUInt8OrDefault('1xx', CAST(2 AS UInt8));

SELECT toInt8OrDefault('-1', CAST(-2 AS Int8));

SELECT toInt8OrDefault('-1xx', CAST(-2 AS Int8));

SELECT toUInt16OrDefault('1', CAST(2 AS UInt16));

SELECT toUInt16OrDefault('1xx', CAST(2 AS UInt16));

SELECT toInt16OrDefault('-1', CAST(-2 AS Int16));

SELECT toInt16OrDefault('-1xx', CAST(-2 AS Int16));

SELECT toUInt32OrDefault('1', CAST(2 AS UInt32));

SELECT toUInt32OrDefault('1xx', CAST(2 AS UInt32));

SELECT toInt32OrDefault('-1', CAST(-2 AS Int32));

SELECT toInt32OrDefault('-1xx', CAST(-2 AS Int32));

SELECT toUInt64OrDefault('1', CAST(2 AS UInt64));

SELECT toUInt64OrDefault('1xx', CAST(2 AS UInt64));

SELECT toInt64OrDefault('-1', CAST(-2 AS Int64));

SELECT toInt64OrDefault('-1xx', CAST(-2 AS Int64));

SELECT toInt128OrDefault('-1', CAST(-2 AS Int128));

SELECT toInt128OrDefault('-1xx', CAST(-2 AS Int128));

SELECT toUInt256OrDefault('1', CAST(2 AS UInt256));

SELECT toUInt256OrDefault('1xx', CAST(2 AS UInt256));

SELECT toInt256OrDefault('-1', CAST(-2 AS Int256));

SELECT toInt256OrDefault('-1xx', CAST(-2 AS Int256));

SELECT toUUIDOrDefault('61f0c404-5cb3-11e7-907b-a6006ad3dba0', CAST('59f0c404-5cb3-11e7-907b-a6006ad3dba0' AS UUID));

SELECT toUUIDOrDefault('-----61f0c404-5cb3-11e7-907b-a6006ad3dba0', CAST('59f0c404-5cb3-11e7-907b-a6006ad3dba0' AS UUID));

SELECT toDateOrDefault('1xxx');

SELECT toDateOrDefault('2023-05-30');

SELECT toDateOrDefault('2023-05-30', '2000-01-01'::Date);

SELECT toDateOrDefault('1xx', '2023-05-30'::Date);

SELECT toDateOrDefault(-1);

SELECT toDateOrDefault(CAST(19 AS Int8));

SELECT toDateOrDefault(CAST(19 AS UInt8));

SELECT toDateOrDefault(CAST(19 AS Int16));

SELECT toDateOrDefault(CAST(19 AS UInt16));

SELECT toDateOrDefault(CAST(19 AS Int32));

SELECT toDateOrDefault(CAST(19 AS UInt32));

SELECT toDateOrDefault(CAST(19 AS Int64));

SELECT toDateOrDefault(CAST(19 AS UInt64));

SELECT toDateOrDefault(CAST(19 AS Int128));

SELECT toDateOrDefault(CAST(19 AS UInt128));

SELECT toDateOrDefault(CAST(19 AS Int256));

SELECT toDateOrDefault(CAST(19 AS UInt256));

SELECT toDateOrDefault(65535);

SELECT toDateOrDefault(65536) IN ('1970-01-01', '1970-01-02');

SELECT toDateOrDefault(19507, '2000-01-01'::Date);

SELECT toDateOrDefault(-1, '2023-05-30'::Date);

SELECT toDateTimeOrDefault('2023-05-30 14:38:20', 'UTC');

SELECT toDateTimeOrDefault('1xxx', 'UTC', '2023-05-30 14:38:20'::DateTime('UTC'));

SELECT toDateTimeOrDefault(1685457500, 'UTC');

SELECT toDateTimeOrDefault(-1, 'UTC', '2023-05-30 14:38:20'::DateTime('UTC'));

SELECT toDateTimeOrDefault(CAST(19 AS Int8), 'UTC');

SELECT toDateTimeOrDefault(CAST(19 AS UInt8), 'UTC');

SELECT toDateTimeOrDefault(CAST(19 AS Int16), 'UTC');

SELECT toDateTimeOrDefault(CAST(19 AS UInt16), 'UTC');

SELECT toDateTimeOrDefault(CAST(19 AS Int32), 'UTC');

SELECT toDateTimeOrDefault(CAST(19 AS UInt32), 'UTC');

SELECT toDateTimeOrDefault(CAST(19 AS Int64), 'UTC');

SELECT toDateTimeOrDefault(CAST(19 AS UInt64), 'UTC');

SELECT toDateTimeOrDefault(CAST(19 AS Int128), 'UTC');

SELECT toDateTimeOrDefault(CAST(19 AS UInt128), 'UTC');

SELECT toDateTimeOrDefault(CAST(19 AS Int256), 'UTC');

SELECT toDateTimeOrDefault(CAST(19 AS UInt256), 'UTC');