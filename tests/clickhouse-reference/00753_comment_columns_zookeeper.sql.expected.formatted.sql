SELECT *
FROM `system`.`columns`
WHERE table = 'check.comments'
    AND database = currentDatabase();