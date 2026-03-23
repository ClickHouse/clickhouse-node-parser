SYSTEM DROP  TABLE IF EXISTS pk_test1;

SYSTEM DROP  TABLE IF EXISTS pk_test2;

SYSTEM DROP  TABLE IF EXISTS pk_test3;

SYSTEM DROP  TABLE IF EXISTS pk_test4;

SYSTEM DROP  TABLE IF EXISTS pk_test5;

SYSTEM DROP  TABLE IF EXISTS pk_test6;

SYSTEM DROP  TABLE IF EXISTS pk_test7;

SYSTEM DROP  TABLE IF EXISTS pk_test8;

SYSTEM DROP  TABLE IF EXISTS pk_test9;

SYSTEM DROP  TABLE IF EXISTS pk_test10;

SYSTEM DROP  TABLE IF EXISTS pk_test11;

SYSTEM DROP  TABLE IF EXISTS pk_test12;

SYSTEM DROP  TABLE IF EXISTS pk_test13;

SYSTEM DROP  TABLE IF EXISTS pk_test14;

SYSTEM DROP  TABLE IF EXISTS pk_test15;

SYSTEM DROP  TABLE IF EXISTS pk_test16;

SYSTEM DROP  TABLE IF EXISTS pk_test17;

SYSTEM DROP  TABLE IF EXISTS pk_test18;

SYSTEM DROP  TABLE IF EXISTS pk_test19;

SYSTEM DROP  TABLE IF EXISTS pk_test20;

SYSTEM DROP  TABLE IF EXISTS pk_test21;

SYSTEM DROP  TABLE IF EXISTS pk_test22;

SYSTEM DROP  TABLE IF EXISTS pk_test23;

SET default_table_engine = 'MergeTree';

CREATE TABLE pk_test1
(
    a String PRIMARY KEY,
    b String,
    c String
)
PRIMARY KEY a;

CREATE TABLE pk_test2
(
    a String PRIMARY KEY,
    b String PRIMARY KEY,
    c String
)
PRIMARY KEY (a, b);

CREATE TABLE pk_test3
(
    a String PRIMARY KEY,
    b String PRIMARY KEY,
    c String PRIMARY KEY
)
PRIMARY KEY (a, b, c);

CREATE TABLE pk_test4
(
    a String,
    b String PRIMARY KEY,
    c String PRIMARY KEY
)
PRIMARY KEY (b, c);

CREATE TABLE pk_test5
(
    a String,
    b String PRIMARY KEY,
    c String
)
PRIMARY KEY b;

CREATE TABLE pk_test6
(
    a String,
    b String,
    c String PRIMARY KEY
)
PRIMARY KEY c;

CREATE TABLE pk_test18
(
    a String PRIMARY KEY,
    b String,
    c String
)
PRIMARY KEY a
ORDER BY (a, b, c);

CREATE TABLE pk_test19
(
    a String PRIMARY KEY,
    b String PRIMARY KEY,
    c String
)
PRIMARY KEY (a, b)
ORDER BY (a, b, c);

CREATE TABLE pk_test20
(
    a String PRIMARY KEY,
    b String PRIMARY KEY,
    c String PRIMARY KEY
)
PRIMARY KEY (a, b, c)
ORDER BY (a, b, c);

CREATE TABLE pk_test21
(
    a String,
    b String PRIMARY KEY,
    c String PRIMARY KEY
)
PRIMARY KEY (b, c)
ORDER BY (a, b, c); -- { serverError BAD_ARGUMENTS }

CREATE TABLE pk_test22
(
    a String,
    b String PRIMARY KEY,
    c String
)
PRIMARY KEY b
ORDER BY (a, b, c); -- { serverError BAD_ARGUMENTS }

CREATE TABLE pk_test23
(
    a String,
    b String,
    c String PRIMARY KEY
)
PRIMARY KEY c
ORDER BY (a, b, c); -- { serverError BAD_ARGUMENTS }