SELECT '--';

SELECT NOT 1;

SELECT formatQuery('SELECT NOT 1');

SELECT formatQuery('SELECT NOT (1)');

SELECT NOT(1, 1, 1);

SELECT formatQuery('SELECT NOT (1, 1, 1)');

SELECT formatQuery('SELECT not(1, 1, 1)');

SELECT NOT tuple(1);

SELECT NOT tuple(1);

SELECT formatQuery('SELECT NOT ((1,))');

SELECT formatQuery('SELECT NOT (tuple(1))');

SELECT formatQuery('SELECT NOT tuple(1)');

SELECT NOT((1, 1, 1));

SELECT formatQuery('SELECT NOT ((1, 1, 1))');

SELECT formatQuery('SELECT not((1, 1, 1))');

SELECT formatQuery('SELECT not tuple(1, 1, 1)');

SELECT formatQuery('SELECT not (tuple(1, 1, 1))');

SELECT NOT [1];

SELECT NOT [(1)];

SELECT formatQuery('SELECT NOT [1]');

SELECT formatQuery('SELECT NOT array(1)');

SELECT formatQuery('SELECT NOT (array(1))');

SELECT formatQuery('SELECT NOT [(1)]');

SELECT formatQuery('SELECT NOT ([1])');

SELECT negate([1]);

SELECT negate([(1)]);

SELECT formatQuery('SELECT -[1]');

SELECT formatQuery('SELECT -array(1)');

SELECT formatQuery('SELECT -(array(1))');

SELECT formatQuery('SELECT -[(1)]');

SELECT formatQuery('SELECT -([1])');

SELECT negate((1, 1, 1));

SELECT formatQuery('SELECT -(1, 1, 1)');

SELECT formatQuery('SELECT negate ((1, 1, 1))');

SELECT formatQuery('SELECT -tuple(1, 1, 1)');

SELECT formatQuery('SELECT -(tuple(1, 1, 1))');

SELECT negate(tuple((1, 1, 1)));

SELECT formatQuery('SELECT -((1, 1, 1))');

SELECT formatQuery('SELECT -tuple((1, 1, 1))');