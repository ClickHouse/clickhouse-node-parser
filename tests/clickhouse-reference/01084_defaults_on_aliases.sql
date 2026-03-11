SELECT * FROM table_with_defaults_on_aliases WHERE col1 = 1;
SELECT col1, col2, col3 FROM table_with_defaults_on_aliases WHERE col1 = 1;
SELECT col3 FROM table_with_defaults_on_aliases; -- important to check without WHERE
SELECT * FROM table_with_defaults_on_aliases WHERE col1 = 2;
SELECT col1, col2, col3, col4 FROM table_with_defaults_on_aliases WHERE col1 = 2;
SELECT * FROM table_with_defaults_on_aliases WHERE col1 = 3;
SELECT col1, col2, col3, col4, col5 FROM table_with_defaults_on_aliases WHERE col1 = 3;
