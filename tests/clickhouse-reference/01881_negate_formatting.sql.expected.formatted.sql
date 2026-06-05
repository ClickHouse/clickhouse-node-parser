-- { echo }
EXPLAIN SYNTAX
SELECT -1;

EXPLAIN SYNTAX
SELECT negate((1));

EXPLAIN SYNTAX
SELECT negate((negate((1))));

EXPLAIN SYNTAX
SELECT negate((negate((negate((1))))));

EXPLAIN SYNTAX
SELECT negate((negate((-1))));

EXPLAIN SYNTAX
SELECT negate((negate(toUInt64(negate((1))))));