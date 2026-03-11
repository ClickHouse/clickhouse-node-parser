SELECT concat(current_database(), '')
FROM (
        SELECT id
        FROM remote('127.0.0.1,127.0.0.2', currentDatabase(), test)
        LIMIT -2147483648
    )
ORDER BY `ALL` ASC
FORMAT Null;

SELECT concat(current_database(), '')
FROM (
        SELECT id
        FROM remote('127.0.0.1,127.0.0.2', currentDatabase(), test)
        OFFSET -2
    )
ORDER BY `ALL` ASC
FORMAT Null;