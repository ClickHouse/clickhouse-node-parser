SELECT 1
FROM merge(currentDatabase(), '^data$')
PREWHERE _table IN (NULL); -- { serverError ILLEGAL_PREWHERE }

SELECT 1
FROM merge(currentDatabase(), '^data$')
WHERE _table IN (NULL);