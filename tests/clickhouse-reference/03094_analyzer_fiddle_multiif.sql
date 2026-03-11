SELECT
    multiIf((age > 30) or (true), '1', '2') AS a,
    max(name)
FROM users_03094
GROUP BY a;
