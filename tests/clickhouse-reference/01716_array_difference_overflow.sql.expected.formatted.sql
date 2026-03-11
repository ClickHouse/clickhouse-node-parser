SELECT arrayDifference([65536, -9223372036854775808]);

SELECT arrayDifference(cast([10, 1], 'Array(UInt8)'));

SELECT arrayDifference(cast([10, 1], 'Array(UInt16)'));

SELECT arrayDifference(cast([10, 1], 'Array(UInt32)'));

SELECT arrayDifference(cast([10, 1], 'Array(UInt64)'));