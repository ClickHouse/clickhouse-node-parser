SELECT 1 IN (1);

SELECT 1 IN (1);

SELECT 1 IN (0);

SELECT 1 IN (0);

SELECT 1 IN (1, 2);

SELECT (1, 1) IN ((1, 1), (1, 2));

SELECT (1, 1) IN ((1, 2), (1, 2));

SELECT 1 IN (((1), (2)));

SELECT '--';

SELECT 1 IN ([1]);

SELECT 1 IN ([0]);

SELECT 1 IN ([1, 2]);

SELECT (1, 1) IN ([(1, 1), (1, 2)]);

SELECT (1, 1) IN ([(1, 2), (1, 2)]);

SELECT (1, 2) IN (1);

SELECT (1, 2) IN ([1]);

SELECT (1, 2) IN (((1, 2), (1, 2)), ((1, 2), (1, 2)));

SELECT (1, 2) IN ([((1, 2), (1, 2)), ((1, 2), (1, 2))]);

SELECT (
        SELECT 1
    ) IN (1);

SELECT in(untuple(((1), (1))));

SELECT in(untuple(((select 1), (1))));