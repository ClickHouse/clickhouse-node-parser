SELECT count(*) FROM numbers(10000) n1 CROSS JOIN numbers(1000) n2; -- { serverError MEMORY_LIMIT_EXCEEDED }
