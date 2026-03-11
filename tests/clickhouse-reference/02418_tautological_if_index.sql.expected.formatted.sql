SELECT count()
FROM constCondOptimization
WHERE if(0, 1, n = 1000);

SELECT count()
FROM constCondOptimization
WHERE if(0, 1, n = 1000)
    AND 1 = 1;