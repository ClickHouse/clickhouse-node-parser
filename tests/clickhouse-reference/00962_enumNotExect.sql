SELECT * FROM t_enum8;
SELECT CAST(x, 'Int8') FROM t_enum8;
SELECT * FROM t_enum16;
SELECT CAST(x, 'Int16') FROM t_enum16;
SELECT toTypeName(CAST('a', 'Enum(\'a\' = 2, \'b\' = 128)'));
SELECT toTypeName(CAST('a', 'Enum(\'a\' = 2, \'b\' = 127)'));
