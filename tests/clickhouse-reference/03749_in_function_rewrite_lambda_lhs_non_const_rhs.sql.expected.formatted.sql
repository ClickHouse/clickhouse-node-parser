SELECT ((y -> 1)) IN (1, 1);

SELECT ((y -> 1)) IN (materialize(1), 2);

SELECT ((y -> 1)) IN ([materialize(1), 2]);

SELECT 1
WHERE ((y -> 1)) IN (materialize(1), 1);