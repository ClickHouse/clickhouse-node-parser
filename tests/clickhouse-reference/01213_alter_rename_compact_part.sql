SELECT value1 FROM table_with_compact_parts WHERE key = 1;
SELECT renamed_value1 FROM table_with_compact_parts WHERE key = 1;
SELECT * FROM table_with_compact_parts WHERE key = 1 FORMAT TSVWithNames;
SELECT renamed_value2, renamed_value3 FROM table_with_compact_parts WHERE key = 7;
SELECT * FROM table_with_compact_parts WHERE key = 7 FORMAT TSVWithNames;
