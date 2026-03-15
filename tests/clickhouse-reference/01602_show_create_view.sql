CREATE DATABASE test_1602;
CREATE TABLE test_1602.tbl (`EventDate` DateTime, `CounterID` UInt32, `UserID` UInt32) ENGINE = MergeTree() PARTITION BY toYYYYMM(EventDate) ORDER BY (CounterID, EventDate, intHash32(UserID)) SETTINGS index_granularity = 8192;
CREATE VIEW test_1602.v AS SELECT * FROM test_1602.tbl;
CREATE VIEW test_1602.DATABASE AS SELECT * FROM test_1602.tbl;
CREATE VIEW test_1602.DICTIONARY AS SELECT * FROM test_1602.tbl;
CREATE VIEW test_1602.TABLE AS SELECT * FROM test_1602.tbl;
CREATE MATERIALIZED VIEW test_1602.vv (`EventDate` DateTime, `CounterID` UInt32, `UserID` UInt32) ENGINE = MergeTree() PARTITION BY toYYYYMM(EventDate) ORDER BY (CounterID, EventDate, intHash32(UserID)) SETTINGS index_granularity = 8192 AS SELECT * FROM test_1602.tbl;
CREATE VIEW test_1602.VIEW AS SELECT * FROM test_1602.tbl;
