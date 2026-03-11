SELECT randConstant() >= 0;

SELECT randConstant() % 10 < 10;

SELECT uniqExact(x)
FROM (
        SELECT randConstant() AS x
    );