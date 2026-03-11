SELECT
    host_id,
    path_id,
    max(rank) AS rank
FROM
(
    WITH
        as_of_posts AS
        (
            SELECT
                *,
                row_number() OVER (PARTITION BY (page_id, post_id) ORDER BY as_of DESC) AS row_num
            FROM posts
            WHERE (created >= subtractHours(now(), 24)) AND (host_id > 0)
        ),
        as_of_post_metrics AS
        (
            SELECT
                *,
                row_number() OVER (PARTITION BY (page_id, post_id) ORDER BY as_of DESC) AS row_num
            FROM post_metrics
            WHERE created >= subtractHours(now(), 24)
        )
    SELECT
        page_id,
        post_id,
        host_id,
        path_id,
        impressions,
        clicks,
        ntile(20) OVER (PARTITION BY page_id ORDER BY clicks ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS rank
    FROM as_of_posts
    GLOBAL LEFT JOIN as_of_post_metrics USING (page_id, post_id, row_num)
    WHERE (row_num = 1) AND (impressions > 0)
) AS t
WHERE t.rank > 18
GROUP BY
    host_id,
    path_id
FORMAT Null;
