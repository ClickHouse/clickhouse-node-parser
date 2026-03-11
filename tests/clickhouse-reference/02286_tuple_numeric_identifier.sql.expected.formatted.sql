SELECT *
FROM t_tuple_numeric
FORMAT JSONEachRow;

SELECT
    t.`1`.`2`,
    t.`1`.`3`,
    t.`4`
FROM t_tuple_numeric;

SELECT
    t.1.1,
    t.1.2,
    t.2
FROM t_tuple_numeric;

SELECT t.1.3
FROM t_tuple_numeric;

SELECT t.4
FROM t_tuple_numeric;

SELECT
    t.`1`.`1`,
    t.`1`.`2`,
    t.`2`
FROM t_tuple_numeric;