SYSTEM drop  table if exists t1;

CREATE TABLE t1
(
    c0 Int32
)
ENGINE = MergeTree()
ORDER BY c0
PARTITION BY (negate((c0)));

INSERT INTO t1;

SELECT
    (negate(((tan(t1.c0)) + (t1.c0)))),
    (cos((sin(pow(t1.c0, t1.c0))))),
    ((gcd((negate((t1.c0))), ((t1.c0) + (t1.c0)))) * (negate((negate((t1.c0))))))
FROM t1
GROUP BY
    (sqrt((negate((t1.c0))))),
    t1.c0,
    pow((erf((negate((t1.c0))))), t1.c0);

SYSTEM drop  table t1;