select ds, numericIndexedVectorToMap(vec)
  , numericIndexedVectorToMap(CAST(vec_str, 'AggregateFunction(groupNumericIndexedVector, UInt32, Float64)'))
from vector_int32_float64;
