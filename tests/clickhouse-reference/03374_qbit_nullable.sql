CREATE TABLE qbit_nullable_test (id UInt32, data Nullable(QBit(Float64, 4))) ENGINE = Memory;
SELECT id, data FROM qbit_nullable_test ORDER BY id;
