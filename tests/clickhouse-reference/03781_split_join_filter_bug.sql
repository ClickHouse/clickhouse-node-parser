SELECT count()
FROM customer LEFT ANTI JOIN nation
ON c_nationkey = n_nationkey AND n_name = 'FRANCE' AND c_custkey = 1;
SELECT count()
FROM customer RIGHT ANTI JOIN nation
ON c_nationkey = n_nationkey AND n_name = 'FRANCE' AND c_custkey = 1;
SELECT count()
FROM customer LEFT SEMI JOIN nation
ON c_nationkey = n_nationkey AND n_name = 'FRANCE' AND c_custkey = 1;
SELECT count()
FROM customer RIGHT SEMI JOIN nation
ON c_nationkey = n_nationkey AND n_name = 'FRANCE' AND c_custkey = 1;
SELECT count()
FROM customer LEFT ANY JOIN nation
ON c_nationkey = n_nationkey AND n_name = 'FRANCE' AND c_custkey = 1;
SELECT count()
FROM customer RIGHT ANY JOIN nation
ON c_nationkey = n_nationkey AND n_name = 'FRANCE' AND c_custkey = 1;
