SELECT reverse(tuple());

SELECT reverse(tuple());

SELECT reverse(tuple())
FROM numbers(3);

SELECT reverse(x)
FROM table_rev_empty_tuple
LIMIT 3;

SELECT toTypeName(reverse(x))
FROM table_rev_empty_tuple
LIMIT 1;

SELECT reverse((1, 'a', 3));

SELECT reverse([()]);

SELECT reverse((tuple()));