CREATE TABLE users_items
(
    user_id UInt64
)
ENGINE = Log;

SELECT sum(in_sample)
FROM (
        WITH RandomUsers AS (
            SELECT
                user_id,
                rand() % 2 AS in_sample
            FROM users_items
            GROUP BY user_id
        )

        SELECT
            user_id,
            in_sample
        FROM RandomUsers
        WHERE in_sample = 0
    );