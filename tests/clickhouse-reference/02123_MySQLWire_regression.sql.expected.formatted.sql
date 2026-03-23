CREATE TABLE table_MySQLWire
(
    x UInt64
)
ENGINE = File(MySQLWire);

INSERT INTO table_MySQLWire SELECT number
FROM numbers(10);