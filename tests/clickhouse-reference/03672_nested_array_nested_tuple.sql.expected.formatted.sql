SYSTEM DROP  TABLE IF EXISTS nest;

CREATE TABLE nest
(
    nested_field Nested(e1 Int32)
)
ENGINE = MergeTree()
ORDER BY nested_field.e1;

INSERT INTO nest (nested_field.e1);

SELECT *
FROM nest;

SYSTEM DROP  TABLE IF EXISTS nest_2;

CREATE TABLE nest_2
(
    nested_field Nested(e1 Int32)
)
ENGINE = MergeTree()
ORDER BY nested_field.e1;

INSERT INTO nest_2 (nested_field.e1);

SELECT *
FROM nest_2;