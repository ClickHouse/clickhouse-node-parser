SELECT sum(y) AS s
FROM
    remote('127.0.0.{2,3}', currentDatabase(), big_array)
ARRAY JOIN x AS y;

SELECT sum(s)
FROM (
        SELECT y AS s
        FROM
            remote('127.0.0.{2,3}', currentDatabase(), big_array)
        ARRAY JOIN x AS y
    );