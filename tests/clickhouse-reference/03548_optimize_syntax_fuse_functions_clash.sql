SELECT sum(number)
FROM t1
PREWHERE number IN ( SELECT sum(number) FROM t1 GROUP BY number )
   WHERE number IN ( SELECT sum(number) FROM t1 GROUP BY number )
GROUP BY number
ORDER BY number
SETTINGS optimize_syntax_fuse_functions = 1
;
