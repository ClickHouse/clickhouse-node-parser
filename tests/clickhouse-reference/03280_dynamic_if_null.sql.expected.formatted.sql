SET enable_dynamic_type = 1;

SELECT ifNull(if(number % 2, NULL, number::Dynamic), 42)
FROM numbers(5);