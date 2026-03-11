SELECT exists((
        SELECT 1
    ))
FROM remote('127.0.0.1', numbers(1));

SELECT exists((
        SELECT 1
    ))
FROM remote('127.0.0.1', numbers(1))
WHERE exists((
        SELECT 1
    ));

SELECT
    exists((
        SELECT 1
    )),
    exists((
        SELECT 2
    ))
FROM remote('127.0.0.1', numbers(1));

SELECT exists((
        SELECT number
        FROM numbers(1)
    ))
FROM remote('127.0.0.1', numbers(1));

SELECT NOT exists((
        SELECT 1
    ))
FROM remote('127.0.0.1', numbers(1));