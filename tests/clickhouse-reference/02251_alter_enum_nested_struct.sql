CREATE TABLE alter_enum_array(
    Key UInt64,
    Value Array(Enum8('Option1'=1, 'Option2'=2))
)
ENGINE=MergeTree()
ORDER BY tuple();
INSERT INTO alter_enum_array VALUES (1, ['Option2', 'Option1']), (2, ['Option1']);
INSERT INTO alter_enum_array VALUES (3, ['Option1','Option3']);
SELECT * FROM alter_enum_array ORDER BY Key;
SELECT COUNT() FROM system.mutations where table='alter_enum_array' and database=currentDatabase() and not is_done;
