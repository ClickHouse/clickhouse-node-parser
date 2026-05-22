WITH if(number % 1000 = 0, (if(rand() % 2, 0.0, -0.0)), number::Float64) AS x

SELECT length(uniqExactState(x)::String)
FROM numbers(1000000);