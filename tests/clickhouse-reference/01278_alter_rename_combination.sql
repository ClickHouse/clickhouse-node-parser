CREATE TABLE rename_table (key Int32, value1 Int32, value2 Int32) ENGINE = MergeTree ORDER BY tuple() SETTINGS min_bytes_for_wide_part=0;
INSERT INTO rename_table VALUES (1, 2, 3);
SELECT * FROM rename_table FORMAT TSVWithNames;
INSERT INTO rename_table VALUES (4, 5, 6);
SELECT * FROM rename_table ORDER BY k FORMAT TSVWithNames;
SELECT '---polymorphic---';
CREATE TABLE rename_table_polymorphic (
  key Int32,
  value1 Int32,
  value2 Int32
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_rows_for_wide_part = 10000;
INSERT INTO rename_table_polymorphic VALUES (1, 2, 3);
SELECT * FROM rename_table_polymorphic FORMAT TSVWithNames;
INSERT INTO rename_table_polymorphic VALUES (4, 5, 6);
SELECT * FROM rename_table_polymorphic ORDER BY k FORMAT TSVWithNames;
