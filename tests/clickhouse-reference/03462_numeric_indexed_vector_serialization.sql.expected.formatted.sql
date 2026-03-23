SYSTEM DROP  TABLE IF EXISTS uin_value_details_int32_float64;

CREATE TABLE uin_value_details_int32_float64
(
    ds Date,
    uin UInt32,
    value Float64
)
ENGINE = MergeTree()
ORDER BY ds;

INSERT INTO uin_value_details_int32_float64 (ds, uin, value);

INSERT INTO uin_value_details_int32_float64 (ds, uin, value);

SYSTEM DROP  TABLE IF EXISTS vector_int32_float64;

CREATE TABLE vector_int32_float64
(
    ds Date,
    vec AggregateFunction(groupNumericIndexedVector, UInt32, Float64),
    vec_str String
)
ENGINE = MergeTree()
ORDER BY ds;

INSERT INTO vector_int32_float64 (ds, vec_str, vec) SELECT
    ds,
    groupNumericIndexedVectorState(uin, value) AS vec,
    CAST(vec, 'String') AS vec_str
FROM uin_value_details_int32_float64
GROUP BY ds;

SELECT
    ds,
    numericIndexedVectorToMap(vec),
    numericIndexedVectorToMap(CAST(vec_str, 'AggregateFunction(groupNumericIndexedVector, UInt32, Float64)'))
FROM vector_int32_float64;