SELECT COUNT()
FROM mutations_and_quorum1;

SELECT COUNT()
FROM mutations_and_quorum2;

SELECT COUNT()
FROM `system`.mutations
WHERE database = currentDatabase()
    AND like(table, 'mutations_and_quorum%')
    AND is_done = 0;