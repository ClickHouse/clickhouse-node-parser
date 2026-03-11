SELECT length(topK(5592405)(tuple(number))) FROM numbers(10) GROUP BY number; -- { serverError MEMORY_LIMIT_EXCEEDED }
