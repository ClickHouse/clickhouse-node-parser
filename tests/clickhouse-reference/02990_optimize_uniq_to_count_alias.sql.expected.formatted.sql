CREATE TABLE tags
(
    dev_tag String
)
ENGINE = Memory AS
SELECT '1';

SELECT *
FROM (
        SELECT countDistinct(dev_tag) AS total_devtags
        FROM (
                SELECT dev_tag
                FROM (
                        SELECT *
                        FROM tags
                    ) AS t
                GROUP BY dev_tag
            ) AS t
    )
SETTINGS optimize_uniq_to_count = 0;

SELECT *
FROM (
        SELECT countDistinct(dev_tag) AS total_devtags
        FROM (
                SELECT dev_tag
                FROM (
                        SELECT *
                        FROM tags
                    ) AS t
                GROUP BY dev_tag
            ) AS t
    )
SETTINGS optimize_uniq_to_count = 1;

CREATE TABLE users
(
    id Int64,
    name String
)
ENGINE = ReplacingMergeTree
ORDER BY (id, name);

SELECT uniqExact(id)
FROM (
        SELECT id
        FROM users
        WHERE id = 1
        GROUP BY
            id,
            name
    );