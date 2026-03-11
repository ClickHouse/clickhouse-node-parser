select numericIndexedVectorShortDebugString(groupNumericIndexedVectorState(uin, value)) from uin_value_details;
select groupNumericIndexedVector(uin, value) from uin_value_details;
select numericIndexedVectorAllValueSum(groupNumericIndexedVectorState(uin, value)) from uin_value_details;
select numericIndexedVectorCardinality(groupNumericIndexedVectorState(uin, value)) from uin_value_details;
select numericIndexedVectorShortDebugString(groupNumericIndexedVectorStateIf(uin, value, ds = '2023-12-26')) from uin_value_details;
select numericIndexedVectorShortDebugString(groupNumericIndexedVectorStateIf(uin, value, ds = '2023-12-27')) from uin_value_details;
select numericIndexedVectorCardinality(groupNumericIndexedVectorState('BSI', 64, 0)(uin, value)) from uin_value_details;
select numericIndexedVectorCardinality(groupNumericIndexedVectorState('BSI', 32, 0)(uin, value)) from uin_value_details;
select numericIndexedVectorCardinality(groupNumericIndexedVectorState('BSI', 16, 0)(uin, value)) from uin_value_details;
select numericIndexedVectorCardinality(groupNumericIndexedVectorState('BSI', 32, 14)(uin, value)) from uin_value_details; -- { serverError BAD_ARGUMENTS }
select numericIndexedVectorCardinality(groupNumericIndexedVectorState('RawSum', 32, 14)(uin, value)) from uin_value_details; -- { serverError BAD_ARGUMENTS }
select numericIndexedVectorCardinality(groupNumericIndexedVectorState('BSI', 64, 14)(uin, value)) from uin_value_details; -- { serverError BAD_ARGUMENTS }
