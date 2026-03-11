SELECT *, throwIf(val <> 'one') as issue FROM column_modify_test WHERE id = 1 FORMAT NULL;
