-- till now everythings looks ok
SELECT * FROM column_modify_test order by id, val, other_col;
-- row 1 is damaged now the column file & columns.txt is out of sync!
SELECT *, throwIf(val <> 'one') as issue FROM column_modify_test WHERE id = 1;
