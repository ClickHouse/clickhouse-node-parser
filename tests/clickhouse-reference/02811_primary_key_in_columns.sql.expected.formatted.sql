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