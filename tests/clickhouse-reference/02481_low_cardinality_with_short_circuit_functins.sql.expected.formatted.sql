SET short_circuit_function_evaluation = 'force_enable';

SELECT if(0, toLowCardinality('a'), 'b');

SELECT if(1, toLowCardinality('a'), 'b');

SELECT if(materialize(0), materialize(toLowCardinality('a')), materialize('b'));

SELECT if(number % 2, toLowCardinality('a'), 'b')
FROM numbers(2);

SELECT if(number % 2, materialize(toLowCardinality('a')), materialize('b'))
FROM numbers(2);

SELECT if(0, toLowCardinality('a'), NULL);

SELECT if(1, toLowCardinality('a'), NULL);

SELECT if(materialize(0), materialize(toLowCardinality('a')), NULL);

SELECT if(number % 2, toLowCardinality('a'), NULL)
FROM numbers(2);

SELECT if(number % 2, materialize(toLowCardinality('a')), NULL)
FROM numbers(2);

SELECT if(0, toLowCardinality('a'), toLowCardinality('b'));

SELECT if(1, toLowCardinality('a'), toLowCardinality('b'));

SELECT if(materialize(0), materialize(toLowCardinality('a')), materialize(toLowCardinality('b')));

SELECT if(number % 2, toLowCardinality('a'), toLowCardinality('b'))
FROM numbers(2);

SELECT if(number % 2, materialize(toLowCardinality('a')), materialize(toLowCardinality('a')))
FROM numbers(2);

SELECT if(number % 2, toLowCardinality(number), NULL)
FROM numbers(2);

SELECT if(number % 2, toLowCardinality(number), toLowCardinality(number + 1))
FROM numbers(2);