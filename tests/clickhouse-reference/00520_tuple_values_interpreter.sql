CREATE TABLE tuple (t Tuple(Date, UInt32, UInt64)) ENGINE = Memory;
SET input_format_values_interpret_expressions = 0;
SELECT * FROM tuple ORDER BY t;
