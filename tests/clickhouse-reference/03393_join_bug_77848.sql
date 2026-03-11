-- TODO(@vdimir): NOT_FOUND_COLUMN_IN_BLOCK is a bug, should be fixed
-- This tests ensures that query does not crash at least

SELECT 1 FROM BadTable i LEFT JOIN BadJoin c ON i.id_uint = toUInt128(c.id) WHERE equals(i.id_uint, 12);
SELECT equals(i.id_uint, 12) FROM BadTable i LEFT JOIN BadJoin c ON i.id_uint = toUInt128(c.id) WHERE equals(i.id_uint, 12);
