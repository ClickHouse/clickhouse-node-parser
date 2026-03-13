SELECT vec::QBit(Float32, 1)
FROM qbits; -- { serverError NOT_IMPLEMENTED }

SELECT vec::QBit(Float64, 2)
FROM qbits; -- { serverError TYPE_MISMATCH }

SELECT vec::QBit(Float64, 1)
FROM qbits;