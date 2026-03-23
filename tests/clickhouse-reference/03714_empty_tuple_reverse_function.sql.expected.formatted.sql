SELECT reverse(tuple());

SELECT reverse(tuple());

SELECT reverse(tuple())
FROM numbers(3);

SYSTEM DROP  TABLE IF EXISTS table_rev_empty_tuple;

CREATE TABLE table_rev_empty_tuple
(
    x Tuple()
)
ENGINE = Memory;

INSERT INTO table_rev_empty_tuple SELECT tuple()
FROM numbers(5);

SELECT reverse(x)
FROM table_rev_empty_tuple
LIMIT 3;

SELECT toTypeName(reverse(x))
FROM table_rev_empty_tuple
LIMIT 1;

SYSTEM DROP  TABLE table_rev_empty_tuple;

SELECT reverse((1, 'a', 3));

SELECT reverse([()]);

SELECT reverse((tuple()));