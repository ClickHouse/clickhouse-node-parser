-- Tags: no-parallel
DROP TABLE IF EXISTS t_2710_show_table;
CREATE TABLE t_2710_show_table(n1 UInt32, s String) engine=Log;
DROP TABLE t_2710_show_table;
DROP DATABASE IF EXISTS t_2710_db;
CREATE DATABASE t_2710_db engine=Atomic;
DROP DATABASE t_2710_db;
