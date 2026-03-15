CREATE TABLE join_test (number UInt8, value Float32) Engine = Join(ANY, LEFT, number);
