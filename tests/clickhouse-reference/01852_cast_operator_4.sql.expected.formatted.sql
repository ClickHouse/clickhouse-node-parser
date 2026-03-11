SELECT [3,4,5][1]::Int32;

SELECT [3,4,5]::Array(Int64)[2]::Int8;

SELECT [1,2,3]::Array(UInt64)[[number, number]::Array(UInt8)[number]::UInt64]::UInt8
FROM numbers(3);

SELECT tuple(3, 4, 5).1::Int32;

SELECT tuple(3, 4, 5)::Tuple(UInt64, UInt64, UInt64).2::Int32;