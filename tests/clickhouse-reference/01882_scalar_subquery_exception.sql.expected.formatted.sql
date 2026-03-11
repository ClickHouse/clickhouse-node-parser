SELECT count() / (
        SELECT count()
        FROM nums_in_mem_dist
        WHERE rand() > 0
    )
FROM `system`.one;