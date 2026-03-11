SELECT tuple(1) < '';

SELECT tuple(1) < materialize('');

SELECT (1, 2) < '(1,3)';

SELECT (1, 2) < '(1, 1)';