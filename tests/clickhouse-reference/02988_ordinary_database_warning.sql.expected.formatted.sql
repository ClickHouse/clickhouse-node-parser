SELECT DISTINCT 'Ok.'
FROM `system`.warnings
WHERE ilike(message, '%Ordinary%')
    AND ilike(message, '%deprecated%');