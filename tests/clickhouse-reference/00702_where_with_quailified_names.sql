CREATE TABLE where_qualified(a UInt32, b UInt8) ENGINE = Memory;
SELECT a from where_qualified WHERE where_qualified.b;
