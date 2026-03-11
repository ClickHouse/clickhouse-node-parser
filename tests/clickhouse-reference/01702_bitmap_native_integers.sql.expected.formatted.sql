SELECT
    * APPLY(bitmapMin),
    * APPLY(bitmapMax)
FROM (
        SELECT * APPLY(groupBitmapState)
        FROM t
    );