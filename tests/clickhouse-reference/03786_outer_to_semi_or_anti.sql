SELECT 1 FROM 
    (SELECT 1) tx 
  ANY LEFT JOIN 
    (SELECT 1 c0) tz 
  ON TRUE 
WHERE tz.c0 = materialize(1);
