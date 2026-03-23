-- Tags: no-parallel
SYSTEM DROP  TABLE IF EXISTS t_2710_show_table;

CREATE TABLE t_2710_show_table
(
    n1 UInt32,
    s String
)
ENGINE = Log;

SYSTEM DROP  TABLE t_2710_show_table;

SYSTEM DROP  DATABASE IF EXISTS t_2710_db;

CREATE DATABASE t_2710_db
ENGINE = Atomic;

SYSTEM DROP  DATABASE t_2710_db;