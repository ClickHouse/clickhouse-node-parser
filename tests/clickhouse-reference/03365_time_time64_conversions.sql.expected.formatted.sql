SELECT toTime(0)::String;

SELECT toTime(12)::String;

SELECT toTime(3600)::String;

SELECT toTime(0);

SELECT toTime(12);

SELECT toTime(3600);

SELECT toTime(360000);

SELECT toTime(-12);

SELECT toTime(-3600);

SELECT toTime(-360000);

SELECT toTime(999999999);

SELECT toTime(0.1);

SELECT toTime(12.1);

SELECT toTime(3600.1);

SELECT toTime(360000.1);

SELECT toTime(-12.1);

SELECT toTime(-3600.1);

SELECT toTime(-360000.1);

SELECT toTime(999999999.1);

SELECT 0::UInt16::Time;

SELECT 12::UInt16::Time;

SELECT 3600::UInt16::Time;

SELECT 0::UInt32::Time;

SELECT 12::UInt32::Time;

SELECT 3600::UInt32::Time;

SELECT 360000::UInt32::Time;

SELECT 0::UInt64::Time;

SELECT 12::UInt64::Time;

SELECT 3600::UInt64::Time;

SELECT 360000::UInt64::Time;

SELECT 999999999::UInt64::Time;

SELECT 0::UInt128::Time;

SELECT 12::UInt128::Time;

SELECT 3600::UInt128::Time;

SELECT 360000::UInt128::Time;

SELECT 999999999::UInt128::Time;

SELECT 0::UInt256::Time;

SELECT 12::UInt256::Time;

SELECT 3600::UInt256::Time;

SELECT 360000::UInt256::Time;

SELECT 999999999::UInt256::Time;

SELECT 0::Int16::Time;

SELECT 12::Int16::Time;

SELECT 3600::Int16::Time;

SELECT -0::Int16::Time;

SELECT -12::Int16::Time;

SELECT -3600::Int16::Time;

SELECT 0::Int32::Time;

SELECT 12::Int32::Time;

SELECT 3600::Int32::Time;

SELECT 360000::Int32::Time;

SELECT -0::Int32::Time;

SELECT -12::Int32::Time;

SELECT -3600::Int32::Time;

SELECT -360000::Int32::Time;

SELECT 0::Int64::Time;

SELECT 12::Int64::Time;

SELECT 3600::Int64::Time;

SELECT 360000::Int64::Time;

SELECT 999999999::Int64::Time;

SELECT -0::Int64::Time;

SELECT -12::Int64::Time;

SELECT -3600::Int64::Time;

SELECT -360000::Int64::Time;

SELECT 0::Int128::Time;

SELECT 12::Int128::Time;

SELECT 3600::Int128::Time;

SELECT 360000::Int128::Time;

SELECT 999999999::Int128::Time;

SELECT -0::Int128::Time;

SELECT -12::Int128::Time;

SELECT -3600::Int128::Time;

SELECT -360000::Int128::Time;

SELECT 0::Int256::Time;

SELECT 12::Int256::Time;

SELECT 3600::Int256::Time;

SELECT 360000::Int256::Time;

SELECT 999999999::Int256::Time;

SELECT -0::Int256::Time;

SELECT -12::Int256::Time;

SELECT -3600::Int256::Time;

SELECT -360000::Int256::Time;

SELECT 0::Float32::Time;

SELECT 12::Float32::Time;

SELECT 3600::Float32::Time;

SELECT 360000::Float32::Time;

SELECT -0::Float32::Time;

SELECT -12::Float32::Time;

SELECT -3600::Float32::Time;

SELECT -360000::Float32::Time;

SELECT 0::Float64::Time;

SELECT 12::Float64::Time;

SELECT 3600::Float64::Time;

SELECT 360000::Float64::Time;

SELECT -0::Float64::Time;

SELECT -12::Float64::Time;

SELECT -3600::Float64::Time;

SELECT -360000::Float64::Time;

SELECT toTime64(0, 0);

SELECT toTime64(12, 0);

SELECT toTime64(3600, 0);

SELECT toTime64(360000, 0);

SELECT toTime64(-12, 0);

SELECT toTime64(-3600, 0);

SELECT toTime64(-360000, 0);

SELECT toTime64(0.1, 2);

SELECT toTime64(12.1, 2);

SELECT toTime64(3600.1, 2);

SELECT toTime64(360000.1, 2);

SELECT toTime64(-12.1, 2);

SELECT toTime64(-3600.1, 2);

SELECT toTime64(-360000.1, 2);

SELECT 0::UInt16::Time64;

SELECT 12::UInt16::Time64;

SELECT 3600::UInt16::Time64;

SELECT 0::UInt32::Time64;

SELECT 12::UInt32::Time64;

SELECT 3600::UInt32::Time64;

SELECT 360000::UInt32::Time64;

SELECT 0::UInt64::Time64;

SELECT 12::UInt64::Time64;

SELECT 3600::UInt64::Time64;

SELECT 360000::UInt64::Time64;

SELECT 0::Int16::Time64;

SELECT 12::Int16::Time64;

SELECT 3600::Int16::Time64;

SELECT -0::Int16::Time64;

SELECT -12::Int16::Time64;

SELECT -3600::Int16::Time64;

SELECT 0::Int32::Time64;

SELECT 12::Int32::Time64;

SELECT 3600::Int32::Time64;

SELECT 360000::Int32::Time64;

SELECT -0::Int32::Time64;

SELECT -12::Int32::Time64;

SELECT -3600::Int32::Time64;

SELECT -360000::Int32::Time64;

SELECT 0::Int64::Time64;

SELECT 12::Int64::Time64;

SELECT 3600::Int64::Time64;

SELECT 360000::Int64::Time64;

SELECT 999999999::Int64::Time64;

SELECT -0::Int64::Time64;

SELECT -12::Int64::Time64;

SELECT -3600::Int64::Time64;

SELECT -360000::Int64::Time64;

SELECT 0::Float32::Time64;

SELECT 12::Float32::Time64;

SELECT 3600::Float32::Time64;

SELECT 360000::Float32::Time64;

SELECT -0::Float32::Time64;

SELECT -12::Float32::Time64;

SELECT -3600::Float32::Time64;

SELECT -360000::Float32::Time64;

SELECT 0::Float64::Time64;

SELECT 12::Float64::Time64;

SELECT 3600::Float64::Time64;

SELECT 360000::Float64::Time64;

SELECT -0::Float64::Time64;

SELECT -12::Float64::Time64;

SELECT -3600::Float64::Time64;

SELECT -360000::Float64::Time64;

SELECT toTime(toDateTime('2022-01-01 12:12:12'));

SELECT toTime(toDateTime('1970-01-01 12:12:12'));

SELECT toTime(toDateTime('2022-01-01 23:99:12'));

SELECT toTime(toDateTime('1970-01-01 23:99:12'));

SELECT toTime(toDateTime('2022-01-01 00:99:12'));

SELECT toTime(toDateTime('1970-01-01 00:99:12'));

SELECT toDateTime(toTime('12:12:12'));

SELECT toDateTime(toTime('23:99:12'));

SELECT toDateTime(toTime('00:99:12'));

SELECT toDateTime(toTime('100:99:12'));

SELECT toDateTime(toTime('999:59:12'));

SELECT toTime(toDateTime64('2022-01-01 12:12:12.123', 2));

SELECT toTime(toDateTime64('1970-01-01 12:12:12.123', 2));

SELECT toTime(toDateTime64('2022-01-01 23:99:12.123', 2));

SELECT toTime(toDateTime64('1970-01-01 23:99:12.123', 2));

SELECT toTime(toDateTime64('2022-01-01 00:99:12.123', 2));

SELECT toTime(toDateTime64('1970-01-01 00:99:12.123', 2));

SELECT toTime64(toDateTime('2022-01-01 12:12:12'), 2);

SELECT toTime64(toDateTime('1970-01-01 12:12:12'), 2);

SELECT toTime64(toDateTime('2022-01-01 23:99:12'), 2);

SELECT toTime64(toDateTime('1970-01-01 23:99:12'), 2);

SELECT toTime64(toDateTime('2022-01-01 00:99:12'), 2);

SELECT toTime64(toDateTime('1970-01-01 00:99:12'), 2);

SELECT toDateTime64(toTime64('12:12:12', 2), 2);

SELECT toDateTime64(toTime64('23:99:12', 2), 2);

SELECT toDateTime64(toTime64('00:99:12', 2), 2);

SELECT toDateTime64(toTime64('100:99:12', 2), 2);

SELECT toDateTime64(toTime64('999:59:12', 2), 2);

SELECT toTime64(toDateTime64('2022-01-01 12:12:12', 2), 2);

SELECT toTime64(toDateTime64('1970-01-01 12:12:12', 2), 2);

SELECT toTime64(toDateTime64('2022-01-01 23:99:12', 2), 2);

SELECT toTime64(toDateTime64('1970-01-01 23:99:12', 2), 2);

SELECT toTime64(toDateTime64('2022-01-01 00:99:12', 2), 2);

SELECT toTime64(toDateTime64('1970-01-01 00:99:12', 2), 2);

SELECT toTime(toDate('2022-01-01'));

SELECT toTime(toDate('1970-01-01'));

SELECT toTime64(toDate('2022-01-01'), 2);

SELECT toTime64(toDate('1970-01-01'), 2);

SELECT toDate(toTime('00:99:12'));

SELECT toDate(toTime('23:99:12'));

SELECT toDate(toTime('999:99:99'));

SELECT toDate32(toTime('00:99:12'));

SELECT toDate32(toTime('23:99:12'));

SELECT toDate32(toTime('999:99:99'));

SELECT toDate32(toTime64('00:99:12', 2));

SELECT toDate32(toTime64('23:99:12', 2));

SELECT toDate32(toTime64('999:99:99', 2));

SELECT toDate(toTime64('00:99:12', 2));

SELECT toDate(toTime64('23:99:12', 2));

SELECT toDate(toTime64('999:99:99', 2));