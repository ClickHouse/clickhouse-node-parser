SELECT keycol, enum_col FROM table_key LEFT JOIN table_with_enum USING (keycol) ORDER BY keycol;
SELECT keycol, enum_col FROM table_key FULL JOIN table_with_enum USING (keycol) ORDER BY keycol;
SELECT keycol, enum_col FROM table_key RIGHT JOIN table_with_enum USING (keycol) ORDER BY keycol;
SELECT keycol, enum_col FROM table_with_enum LEFT JOIN table_key USING (keycol) ORDER BY keycol;
SELECT keycol, enum_col FROM table_with_enum RIGHT JOIN table_key USING (keycol) ORDER BY keycol;
SELECT keycol, enum_col FROM table_with_enum FULL JOIN table_key USING (keycol) ORDER BY keycol;
