CREATE TABLE uin_value_details_int32_float64
(
    ds Date,
    uin UInt32,
    value Float64
)
ENGINE = MergeTree()
ORDER BY ds;
CREATE TABLE vector_int32_float64
(
    ds Date
    , vec AggregateFunction(groupNumericIndexedVector, UInt32, Float64)
    , vec_str String
)
ENGINE = MergeTree()
ORDER BY ds;
select ds, numericIndexedVectorToMap(vec)
  , numericIndexedVectorToMap(CAST(vec_str, 'AggregateFunction(groupNumericIndexedVector, UInt32, Float64)'))
from vector_int32_float64;
