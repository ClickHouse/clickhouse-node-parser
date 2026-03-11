SELECT sipHash64(number, 42::Variant(UInt64, String))
FROM numbers(2);