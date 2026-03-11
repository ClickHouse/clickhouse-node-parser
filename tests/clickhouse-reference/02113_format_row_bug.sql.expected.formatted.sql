SELECT formatRow('ORC', number, toDate(number))
FROM numbers(5);

SELECT formatRow('Parquet', number, toDate(number))
FROM numbers(5);

SELECT formatRow('Arrow', number, toDate(number))
FROM numbers(5);

SELECT formatRow('Native', number, toDate(number))
FROM numbers(5);