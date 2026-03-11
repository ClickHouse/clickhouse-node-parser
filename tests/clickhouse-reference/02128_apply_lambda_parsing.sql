SELECT * APPLY lambda(tuple(x), 1) FROM numbers(5);
SELECT * APPLY lambda(tuple(x), x + 1) FROM numbers(5);
