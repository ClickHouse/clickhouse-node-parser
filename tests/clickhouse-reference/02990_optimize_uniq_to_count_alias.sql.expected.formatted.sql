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

SELECT uniqExact(id)
FROM (
        SELECT id
        FROM users
        WHERE id = 1
        GROUP BY
            id,
            name
    );