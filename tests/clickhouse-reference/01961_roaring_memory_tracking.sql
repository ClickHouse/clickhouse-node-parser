SELECT cityHash64(rand() % 1000) as n, groupBitmapState(number) FROM numbers_mt(200000000) GROUP BY n FORMAT Null; -- { serverError MEMORY_LIMIT_EXCEEDED }
