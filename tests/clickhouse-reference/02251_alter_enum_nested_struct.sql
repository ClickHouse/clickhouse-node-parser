CREATE TABLE alter_enum_array(
    Key UInt64,
    Value Array(Enum8('Option1'=1, 'Option2'=2))
)
ENGINE=MergeTree()
ORDER BY tuple();
SELECT * FROM alter_enum_array ORDER BY Key;
SELECT COUNT() FROM system.mutations where table='alter_enum_array' and database=currentDatabase() and not is_done;
