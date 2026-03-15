CREATE TABLE nest (nested_field Nested(e1 Int32)) ENGINE = MergeTree() ORDER BY nested_field.e1;
SELECT * FROM nest;
CREATE TABLE nest_2 (nested_field Nested(e1 Int32)) ENGINE = MergeTree() ORDER BY nested_field.e1;
SELECT * FROM nest_2;
