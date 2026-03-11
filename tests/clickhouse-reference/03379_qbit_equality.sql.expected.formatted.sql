SELECT [0, 0, 0, 0, 0, 0]::QBit(BFloat16, 6) == [0, 0, 0, 0, 0, 0]::QBit(BFloat16, 6);

SELECT [0, 0, 0, 0, 0, 0]::QBit(BFloat16, 6) != [0, 0, 0, 0, 0, 0]::QBit(BFloat16, 6);

SELECT [0, 0, 0, 0, 0, 0]::QBit(Float32, 6) == [0, 0, 0, 0, 0, 0]::QBit(BFloat16, 6);

SELECT [0, 0, 0, 0, 0, 0]::QBit(BFloat16, 6) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]::QBit(BFloat16, 14);