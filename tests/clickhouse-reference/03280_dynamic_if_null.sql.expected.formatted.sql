SELECT ifNull(if(number % 2, NULL, number::Dynamic), 42)
FROM numbers(5);