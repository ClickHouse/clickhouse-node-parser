SELECT x, row_number() OVER (ORDER BY x) AS r FROM t QUALIFY r = 1
