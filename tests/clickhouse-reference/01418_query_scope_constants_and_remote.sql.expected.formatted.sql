SELECT c >= 0
FROM (
        SELECT randConstant() AS c
        FROM remote('127.0.0.{1,2}', numbers_mt(1))
    );

SELECT c >= 0
FROM (
        SELECT randConstant() AS c
        FROM remote('127.0.0.{3,2}', numbers_mt(1))
    );

SELECT c >= 0
FROM (
        SELECT randConstant() AS c
        FROM remote('127.0.0.1', numbers_mt(1))
    );