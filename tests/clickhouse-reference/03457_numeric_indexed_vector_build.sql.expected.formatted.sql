DROP TABLE IF EXISTS uin_value_details;

CREATE TABLE uin_value_details
(
    ds Date,
    uin UInt32,
    value UInt64
)
ENGINE = MergeTree()
ORDER BY ds;

INSERT INTO uin_value_details (ds, uin, value);

INSERT INTO uin_value_details (ds, uin, value);

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
FROM uin_value_details; -- { serverError BAD_ARGUMENTS }

SELECT numericIndexedVectorCardinality(groupNumericIndexedVectorState('RawSum', 32, 14)(uin, value))
FROM uin_value_details; -- { serverError BAD_ARGUMENTS }

SELECT numericIndexedVectorCardinality(groupNumericIndexedVectorState('BSI', 64, 14)(uin, value))
FROM uin_value_details; -- { serverError BAD_ARGUMENTS }