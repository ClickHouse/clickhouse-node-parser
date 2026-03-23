DROP TABLE IF EXISTS alter_enum_array;

CREATE TABLE alter_enum_array
(
    Key UInt64,
    Value Array(Enum8('Option1' = 1, 'Option2' = 2))
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO alter_enum_array;

INSERT INTO alter_enum_array;

SELECT *
FROM alter_enum_array
ORDER BY Key ASC;

SELECT COUNT()
FROM `system`.mutations
WHERE table = 'alter_enum_array'
    AND database = currentDatabase()
    AND NOT is_done;