SELECT numericIndexedVectorShortDebugString(groupNumericIndexedVectorState(uin, value))
FROM uin_value_details;

SELECT groupNumericIndexedVector(uin, value)
FROM uin_value_details;

SELECT numericIndexedVectorAllValueSum(groupNumericIndexedVectorState(uin, value))
FROM uin_value_details;

SELECT numericIndexedVectorCardinality(groupNumericIndexedVectorState(uin, value))
FROM uin_value_details;

SELECT numericIndexedVectorShortDebugString(groupNumericIndexedVectorStateIf(uin, value, ds = '2023-12-26'))
FROM uin_value_details;

SELECT numericIndexedVectorShortDebugString(groupNumericIndexedVectorStateIf(uin, value, ds = '2023-12-27'))
FROM uin_value_details;

SELECT numericIndexedVectorCardinality(groupNumericIndexedVectorState('BSI', 64, 0)(uin, value))
FROM uin_value_details;

SELECT numericIndexedVectorCardinality(groupNumericIndexedVectorState('BSI', 32, 0)(uin, value))
FROM uin_value_details;

SELECT numericIndexedVectorCardinality(groupNumericIndexedVectorState('BSI', 16, 0)(uin, value))
FROM uin_value_details;

SELECT numericIndexedVectorCardinality(groupNumericIndexedVectorState('BSI', 32, 14)(uin, value))
FROM uin_value_details;

SELECT numericIndexedVectorCardinality(groupNumericIndexedVectorState('RawSum', 32, 14)(uin, value))
FROM uin_value_details;

SELECT numericIndexedVectorCardinality(groupNumericIndexedVectorState('BSI', 64, 14)(uin, value))
FROM uin_value_details;