SELECT 1 FROM 
    t0 t1 
  LEFT SEMI JOIN 
    t0 t2 
  ON t1.c0 = t2.c0
WHERE t1.c0 = t2.c0;
SELECT 1 FROM 
    t0 t1 
  ANY JOIN 
    t0 t2 
  ON t1.c0 = t2.c0
WHERE t1.c0 = t2.c0;
SELECT 1 FROM 
    t0 t1 
  RIGHT SEMI JOIN 
    t0 t2 
  ON t1.c0 = t2.c0
WHERE t1.c0 = t2.c0;
