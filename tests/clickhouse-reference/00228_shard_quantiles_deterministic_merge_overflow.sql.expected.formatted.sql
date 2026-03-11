SELECT quantilesDeterministic(0.5, 0.9)(number, number)
FROM (
        SELECT number
        FROM `system`.numbers
        LIMIT 101
    );

SELECT ignore(quantilesDeterministic(0.5, 0.9)(number, number))
FROM (
        SELECT number
        FROM remote('127.0.0.{2,3}', `system`, numbers)
        LIMIT 1000000
    );