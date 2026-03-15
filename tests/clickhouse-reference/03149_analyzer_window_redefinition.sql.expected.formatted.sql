CREATE TABLE users
(
    uid Int16,
    name String,
    age Int16
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT count(*)
FROM users
WINDOW
    w AS (ORDER BY uid),
    w AS (ORDER BY name); -- { serverError BAD_ARGUMENTS }