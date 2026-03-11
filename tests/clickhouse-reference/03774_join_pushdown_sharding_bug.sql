SELECT * FROM tab_l AS l 
INNER JOIN tab_m AS m ON l.a = m.a 
INNER JOIN tab_r AS r ON ((l.a * 2) = (r.a * 2)) AND ((l.b + l.c) = (r.c * 2)) AND (l.d = r.d) 
WHERE 0 LIMIT 10;
