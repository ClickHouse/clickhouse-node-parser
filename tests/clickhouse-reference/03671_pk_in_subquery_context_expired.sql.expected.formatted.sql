SELECT uniq(id2) AS count
FROM (
        WITH cte AS (
            SELECT id2
            FROM tbl
            WHERE joinGet(concat(currentDatabase(), '.join_engine'), 'v', id1, id2) = tbl.v
        )

        SELECT *
        FROM tbl AS e
        WHERE joinGet(concat(currentDatabase(), '.join_engine'), 'v', id1, id2) = e.v
    )
WHERE id2 IN (
        SELECT id2
        FROM (
                SELECT id2
                FROM tbl
                WHERE joinGet(concat(currentDatabase(), '.join_engine'), 'v', id1, id2) = tbl.v
            )
    )
UNION ALL
SELECT uniq(id2) AS count
FROM (
        SELECT id2
        FROM tbl
        WHERE joinGet(concat(currentDatabase(), '.join_engine'), 'v', id1, id2) = tbl.v
    );