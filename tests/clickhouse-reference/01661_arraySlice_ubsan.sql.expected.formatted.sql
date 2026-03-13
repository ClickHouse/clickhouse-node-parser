-- { echo }
-- tests with INT64_MIN (UBsan)
SELECT arraySlice([], -9223372036854775808);