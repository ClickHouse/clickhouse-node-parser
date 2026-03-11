SELECT max(number::Dynamic)
FROM numbers(10);

SELECT min(number::Dynamic)
FROM numbers(10);

SELECT argMax(number, number::Dynamic)
FROM numbers(10);

SELECT argMin(number, number::Dynamic)
FROM numbers(10);

SELECT anyArgMax(number, number::Dynamic)
FROM numbers(10);

SELECT anyArgMin(number, number::Dynamic)
FROM numbers(10);

SELECT max(number::Variant(UInt64))
FROM numbers(10);

SELECT min(number::Variant(UInt64))
FROM numbers(10);

SELECT argMax(number, number::Variant(UInt64))
FROM numbers(10);

SELECT argMin(number, number::Variant(UInt64))
FROM numbers(10);

SELECT anyArgMax(number, number::Variant(UInt64))
FROM numbers(10);

SELECT anyArgMin(number, number::Variant(UInt64))
FROM numbers(10);