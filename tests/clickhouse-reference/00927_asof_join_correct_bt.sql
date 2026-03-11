
SELECT A.k, A.t, A.a, B.b, B.t, B.k FROM A ASOF LEFT JOIN B1 B USING(k,t) ORDER BY (A.k, A.t);
SELECT A.k, A.t, A.a, B.b, B.t, B.k FROM A ASOF LEFT JOIN B2 B USING(k,t) ORDER BY (A.k, A.t);
SELECT A.k, A.t, A.a, B.b, B.t, B.k FROM A ASOF LEFT JOIN B3 B USING(k,t) ORDER BY (A.k, A.t);
