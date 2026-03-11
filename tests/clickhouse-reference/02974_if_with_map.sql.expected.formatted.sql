SELECT if(number % 2 = 0, map(1, 2, 3, 4), map(3, 4, 5, 6))
FROM numbers(2);

SELECT if(number % 2 = 0, materialize(map(1, 2, 3, 4)), map(3, 4, 5, 6))
FROM numbers(2);

SELECT if(number % 2 = 0, map(3, 4, 5, 6), materialize(map(1, 2, 3, 4)))
FROM numbers(2);

SELECT if(number % 2 = 0, materialize(map(3, 4, 5, 6)), materialize(map(1, 2, 3, 4)))
FROM numbers(2);

SELECT if(number % 2 = 0, map(1, 2, 3, 4), map(3, 4))
FROM numbers(2);

SELECT if(number % 2 = 0, materialize(map(1, 2, 3, 4)), map(3, 4))
FROM numbers(2);

SELECT if(number % 2 = 0, map(3, 4, 5, 6), materialize(map(1, 2)))
FROM numbers(2);

SELECT if(number % 2 = 0, materialize(map(3, 4, 5, 6)), materialize(map(1, 2)))
FROM numbers(2);

SELECT if(1, map(1, 2, 3, 4), map(3, 4, 5, 6))
FROM numbers(2);

SELECT if(0, map(1, 2, 3, 4), map(3, 4, 5, 6))
FROM numbers(2);

SELECT if(NULL, map(1, 2, 3, 4), map(3, 4, 5, 6))
FROM numbers(2);

SELECT if(1, materialize(map(1, 2, 3, 4)), map(3, 4, 5, 6))
FROM numbers(2);

SELECT if(0, materialize(map(1, 2, 3, 4)), map(3, 4, 5, 6))
FROM numbers(2);

SELECT if(NULL, materialize(map(1, 2, 3, 4)), map(3, 4, 5, 6))
FROM numbers(2);

SELECT if(1, map(3, 4, 5, 6), materialize(map(1, 2, 3, 4)))
FROM numbers(2);

SELECT if(0, map(3, 4, 5, 6), materialize(map(1, 2, 3, 4)))
FROM numbers(2);

SELECT if(NULL, map(3, 4, 5, 6), materialize(map(1, 2, 3, 4)))
FROM numbers(2);

SELECT if(1, materialize(map(3, 4, 5, 6)), materialize(map(1, 2, 3, 4)))
FROM numbers(2);

SELECT if(0, materialize(map(3, 4, 5, 6)), materialize(map(1, 2, 3, 4)))
FROM numbers(2);

SELECT if(NULL, materialize(map(3, 4, 5, 6)), materialize(map(1, 2, 3, 4)))
FROM numbers(2);