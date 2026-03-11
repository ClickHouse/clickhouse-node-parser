SELECT is_done
FROM `system`.mutations
WHERE table = 'mmm'
    AND database = currentDatabase();

SELECT *
FROM mmm;