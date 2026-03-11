SELECT
    hits.date,
    arrayFilter(x -> (x IN (2, 3)), data) AS filtered
FROM hits
WHERE arrayExists(x -> (x IN (2, 3)), data)
SETTINGS enable_analyzer = 1;