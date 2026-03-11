SELECT *
FROM rename_table
FORMAT TSVWithNames;

SELECT *
FROM rename_table
ORDER BY k ASC
FORMAT TSVWithNames;

SELECT '---polymorphic---';

SELECT *
FROM rename_table_polymorphic
FORMAT TSVWithNames;

SELECT *
FROM rename_table_polymorphic
ORDER BY k ASC
FORMAT TSVWithNames;