SELECT '-- negative tests';

SELECT locate();

SELECT locate(1, 'abc');

SELECT locate('abc', 1);

SELECT locate('abc', 'abc', 'abc');

SELECT locate('abcabc', 'ca');

SELECT locate('abcabc', 'ca')
SETTINGS function_locate_has_mysql_compatible_argument_order = true;

SELECT locate('abcabc', 'ca')
SETTINGS function_locate_has_mysql_compatible_argument_order = false;