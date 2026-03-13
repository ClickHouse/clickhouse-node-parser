SELECT COUNT(*)
FROM zero_rows_per_granule;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'zero_rows_per_granule'
    AND database = currentDatabase()
    AND active = 1;

SELECT COUNT(*)
FROM zero_rows_per_granule FINAL;

SELECT sum(marks)
FROM `system`.parts
WHERE table = 'zero_rows_per_granule'
    AND database = currentDatabase()
    AND active = 1;

SELECT '-----';

SELECT COUNT(*)
FROM four_rows_per_granule;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'four_rows_per_granule'
    AND database = currentDatabase()
    AND active = 1;

-- We expect zero marks here, so we might get zero rows if all the parts were
-- deleted already. This can happen in parallel runs where there may be a long delay
-- between queries. So we must write the query in such a way that it always returns
-- zero rows if OK.
SELECT DISTINCT (marks) AS d
FROM `system`.parts
WHERE table = 'four_rows_per_granule'
    AND database = currentDatabase()
    AND active = 1
HAVING d > 0;

SELECT COUNT(*)
FROM six_rows_per_granule;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'six_rows_per_granule'
    AND database = currentDatabase()
    AND active = 1;

-- We expect zero marks here, so we might get zero rows if all the parts were
-- deleted already. This can happen in parallel runs where there may be a long delay
-- between queries. So we must write the query in such a way that it always returns
-- zero rows if OK.
SELECT DISTINCT (marks) AS d
FROM `system`.parts
WHERE table = 'six_rows_per_granule'
    AND database = currentDatabase()
    AND active = 1
HAVING d > 0;