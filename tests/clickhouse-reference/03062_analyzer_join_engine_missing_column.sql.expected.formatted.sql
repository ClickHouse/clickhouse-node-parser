SELECT
    *,
    joinGet('test_join', 'OFFSET', TOPIC, `PARTITION`)
FROM test;

SELECT *
FROM
    test
LEFT JOIN test_join
    USING (TOPIC, `PARTITION`);