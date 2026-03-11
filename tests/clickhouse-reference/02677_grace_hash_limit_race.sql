SELECT count() FROM (
    SELECT f.id FROM test_grace_hash AS f
    LEFT JOIN test_grace_hash AS d
    ON f.id = d.id
    LIMIT 1000
);
