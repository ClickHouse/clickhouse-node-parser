SELECT count(*)
FROM remote('127.0.0.{2,3}', currentDatabase(), numbers500k)
WHERE bitmapContains((
        SELECT groupBitmapState(number)
        FROM numbers500k
    ), toUInt32(number));