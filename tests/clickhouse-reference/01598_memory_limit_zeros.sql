select 'test', count(*) from zeros_mt(1000000) where not ignore(zero); -- { serverError MEMORY_LIMIT_EXCEEDED }
