SELECT pe, pe.values.a FROM (SELECT * FROM t2) ARRAY JOIN pe SETTINGS enable_analyzer = 1;
SELECT p, p.values.a FROM (SELECT * FROM t2) ARRAY JOIN pe AS p SETTINGS enable_analyzer = 1;
SELECT pe, pe.values.a FROM t2 ARRAY JOIN pe;
SELECT p, p.values.a FROM t2 ARRAY JOIN pe AS p;
SELECT c.pe, c.pe.values.a FROM (SELECT * FROM t3) ARRAY JOIN c.pe SETTINGS enable_analyzer = 1;
SELECT p, p.values.a FROM (SELECT * FROM t3) ARRAY JOIN c.pe as p SETTINGS enable_analyzer = 1;
SELECT c.pe, c.pe.values.a FROM t3 ARRAY JOIN c.pe SETTINGS enable_analyzer = 1;
SELECT p, p.values.a FROM t3 ARRAY JOIN c.pe as p;
