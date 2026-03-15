SELECT '-- test create table --';

SELECT *
FROM kql('Customers|project FirstName')
LIMIT 1;

SELECT LastName
FROM kql_table1
LIMIT 1;

SELECT *
FROM kql_table2
LIMIT 1;