SELECT a
FROM t_02559
PREWHERE sin(a) < b
    AND sin(a) < c;

SELECT sin(a) > 2
FROM t_02559
PREWHERE sin(a) < b
    AND sin(a) < c;

SELECT sin(a) < a
FROM t_02559
PREWHERE sin(a) < b
    AND sin(a) < c
    AND sin(a) > negate(a);

SELECT sin(a) < a
FROM t_02559
PREWHERE sin(a) < b
    AND a <= c
    AND sin(a) > negate(a);