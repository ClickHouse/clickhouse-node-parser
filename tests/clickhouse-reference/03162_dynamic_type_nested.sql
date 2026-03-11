SELECT dynamicType(d),
       d,
       d.`Nested(x UInt32, y Dynamic)`.x,
       d.`Nested(x UInt32, y Dynamic)`.y,
       dynamicType(d.`Nested(x UInt32, y Dynamic)`.y[1]),
       d.`Nested(x UInt32, y Dynamic)`.y.`String`,
       d.`Nested(x UInt32, y Dynamic)`.y.`Tuple(Int64, Array(String))`
FROM t ORDER BY d
FORMAT PrettyCompactMonoBlock;
