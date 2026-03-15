CREATE TABLE users
(
    date DateTime,
    name String,
    age Int16
)
ENGINE = MergeTree()
ORDER BY date;

SELECT *
FROM users
ORDER BY date ASC WITH FILL TO '2024-02-17' STEP toIntervalHour(1); -- { serverError INVALID_WITH_FILL_EXPRESSION }