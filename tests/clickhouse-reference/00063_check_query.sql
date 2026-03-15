-- Tags: log-engine

SET check_query_single_value_result = 1;
CREATE TABLE check_query_tiny_log (N UInt32, S String) Engine = TinyLog;
CREATE TABLE check_query_log (N UInt32,S String) Engine = Log;
