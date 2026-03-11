SELECT count()
FROM tab1
WHERE id IN (
        SELECT filter_id
        FROM tab2
    );