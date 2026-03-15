SET enable_analyzer = 1;

SET allow_experimental_correlated_subqueries = 0;

CREATE TABLE users
(
    uid Int16,
    name String,
    age Int16
)
ENGINE = Memory;

CREATE FUNCTION oldest_before AS age_max -> (
    SELECT uid
    FROM users
    WHERE users.age < age_max
    ORDER BY users.age DESC
    LIMIT 1
);

SELECT
    *,
    oldest_before(users.age)
FROM users; -- { serverError UNSUPPORTED_METHOD }