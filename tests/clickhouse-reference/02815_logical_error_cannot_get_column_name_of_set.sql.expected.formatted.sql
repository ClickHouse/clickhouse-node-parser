SELECT *
FROM numbers( SETTINGS x = 1);

SELECT *
FROM numbers(numbers( SETTINGS x = 1));

SELECT *
FROM numbers(numbers( SETTINGS x = 1) SETTINGS x = 1);