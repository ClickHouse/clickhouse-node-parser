SET enable_analyzer = 1;

SET allow_experimental_correlated_subqueries = 1;

SET enable_parallel_replicas = 0;

CREATE TABLE users
(
    uid Int16,
    name String,
    age Int16
)
ORDER BY uid;

SELECT
    name,
    (
        SELECT count()
        FROM numbers(50)
        WHERE number = age
    )
FROM users
ORDER BY name ASC;