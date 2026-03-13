SELECT max(number::Dynamic)
FROM numbers(10); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT min(number::Dynamic)
FROM numbers(10); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT argMax(number, number::Dynamic)
FROM numbers(10); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT argMin(number, number::Dynamic)
FROM numbers(10); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT anyArgMax(number, number::Dynamic)
FROM numbers(10); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT anyArgMin(number, number::Dynamic)
FROM numbers(10); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT max(number::Variant(UInt64))
FROM numbers(10); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT min(number::Variant(UInt64))
FROM numbers(10); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT argMax(number, number::Variant(UInt64))
FROM numbers(10); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT argMin(number, number::Variant(UInt64))
FROM numbers(10); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT anyArgMax(number, number::Variant(UInt64))
FROM numbers(10); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT anyArgMin(number, number::Variant(UInt64))
FROM numbers(10); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}