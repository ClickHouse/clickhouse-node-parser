SELECT reverse(());
SELECT reverse(tuple());
SELECT reverse(()) FROM numbers(3);
CREATE TABLE table_rev_empty_tuple
(
    x Tuple()
) ENGINE = Memory;
INSERT INTO table_rev_empty_tuple SELECT tuple() FROM numbers(5);
SELECT reverse(x) FROM table_rev_empty_tuple LIMIT 3;
SELECT toTypeName(reverse(x)) FROM table_rev_empty_tuple LIMIT 1;
SELECT reverse((1, 'a', 3));
SELECT reverse([()]);
SELECT reverse((()));
