SELECT [1, 2] IN ([1, 2]);

SELECT (1, 2) IN (1, 2);

SELECT (1, 2) IN ([(1, 3), (1, 2)]);

SELECT [1] IN ([[1], [2, 3]]);

SELECT NULL IN (NULL);

SELECT ([1], [2]) IN ([NULL], [NULL]);

SELECT ([1], [2]) IN (([NULL], [NULL]), ([1], [2]));

SELECT ([1], [2]) IN ([([NULL], [NULL]), ([1], [2])]);