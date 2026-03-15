CREATE TABLE t_ephemeral_enum (x UInt32, y Enum8('a' = 1, 'b' = 2) EPHEMERAL) ENGINE = Memory;
CREATE TABLE t_ephemeral_enum (x UInt32, y Enum16('foo' = 100, 'bar' = 200) EPHEMERAL) ENGINE = Memory;
