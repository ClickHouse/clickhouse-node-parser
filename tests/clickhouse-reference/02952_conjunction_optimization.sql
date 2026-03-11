SELECT * FROM 02952_disjunction_optimization WHERE a <> 1 AND a <> 2 AND a <> 4;
SELECT * FROM 02952_disjunction_optimization WHERE a <> 1 AND a <> 2 AND a <> 4 AND true;
SELECT * FROM 02952_disjunction_optimization WHERE a <> 1 AND a <> 2 AND a <> 4 AND b <> '';
SELECT * FROM 02952_disjunction_optimization WHERE a <> 1 AND a <> 2 AND b = '' AND a <> 4;
SELECT * FROM 02952_disjunction_optimization WHERE (a <> 1 AND a <> 2 AND a <> 4) OR b = '';
