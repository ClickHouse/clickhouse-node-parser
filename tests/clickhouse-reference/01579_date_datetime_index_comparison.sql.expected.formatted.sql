SELECT 1
FROM test_index
WHERE date < toDateTime('2020-10-30 06:00:00');

SELECT toTypeName([-1, toUInt32(1)]);

-- We don't promote to wide integers
SELECT toTypeName([-1, toUInt64(1)]); -- { serverError NO_COMMON_TYPE }

SELECT toTypeName([-1, toInt128(1)]);

SELECT toTypeName([toInt64(-1), toInt128(1)]);

SELECT toTypeName([toUInt64(1), toUInt256(1)]);