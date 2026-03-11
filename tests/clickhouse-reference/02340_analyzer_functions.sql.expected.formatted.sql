SELECT 1 + 1;

SELECT '--';

SELECT dummy + dummy;

SELECT id + length(value)
FROM test_table;

SELECT concat(concat(toString(id), '_'), (value))
FROM test_table;