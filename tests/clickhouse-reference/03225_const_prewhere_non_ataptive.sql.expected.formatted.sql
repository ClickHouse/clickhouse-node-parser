SELECT *
FROM t_const_prewhere
PREWHERE 1;

SELECT *
FROM t_const_prewhere
PREWHERE materialize(1);