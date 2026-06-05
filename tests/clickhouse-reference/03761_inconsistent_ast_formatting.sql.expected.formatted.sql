SET enable_analyzer = 1;

EXPLAIN SYNTAX
SELECT (negate((42)))[3];

EXPLAIN SYNTAX
SELECT (negate(('a'))).1;