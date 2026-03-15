CREATE TABLE default_join1(a Int64, b Int64) ENGINE=Memory;
CREATE TABLE default_join2(a Int64, b Int64) ENGINE=Memory;
SELECT a, b FROM default_join1 JOIN (SELECT a, b FROM default_join2) js2 USING a ORDER BY b SETTINGS join_default_strictness='ANY';
