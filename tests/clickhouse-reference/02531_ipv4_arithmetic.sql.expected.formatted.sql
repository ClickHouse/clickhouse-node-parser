SELECT
    number,
    ip,
    ip % number
FROM (
        SELECT
            number,
            toIPv4('1.2.3.4') AS ip
        FROM numbers(10, 20)
    );

SELECT
    number,
    ip,
    number % ip
FROM (
        SELECT
            number,
            toIPv4OrNull('0.0.0.3') AS ip
        FROM numbers(10, 20)
    );