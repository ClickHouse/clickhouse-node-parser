SELECT key, length(val) FROM (
    SELECT * FROM 03457_data WHERE key GLOBAL IN (03457_filter)
)
ORDER BY key;
SELECT replaceRegexpAll(trim(explain), '__table\d\.|__set_\d+_\d+|_subquery\d+|03457_filter', '')
FROM (
    EXPLAIN actions = 1
    SELECT * FROM 03457_data WHERE key GLOBAL IN (03457_filter)
)
WHERE explain LIKE '%Prewhere filter column: globalIn%';
SELECT key, length(val) FROM (
    SELECT * FROM 03457_data WHERE key GLOBAL IN (SELECT * FROM 03457_filter WHERE key = 3)
)
ORDER BY key;
SELECT replaceRegexpAll(trim(explain), '__table\d\.|__set_\d+_\d+|_subquery\d+|03457_filter', '')
FROM (
    EXPLAIN actions = 1
    SELECT * FROM 03457_data WHERE key GLOBAL IN (SELECT * FROM 03457_filter WHERE key = 3)
)
WHERE explain LIKE '%Prewhere filter column: globalIn%';
SELECT key, length(val) FROM (
    SELECT * FROM 03457_data WHERE key GLOBAL NOT IN (03457_filter)
)
ORDER BY key
LIMIT 5;
SELECT replaceRegexpAll(trim(explain), '__table\d\.|__set_\d+_\d+|_subquery\d+|03457_filter', '')
FROM (
    EXPLAIN actions = 1
    SELECT * FROM 03457_data WHERE key GLOBAL NOT IN (03457_filter)
)
WHERE explain LIKE '%Prewhere filter column: globalNotIn%';
SELECT key, length(val) FROM (
    SELECT * FROM 03457_data WHERE key GLOBAL NOT IN (SELECT * FROM 03457_filter WHERE key = 3)
)
ORDER BY key
LIMIT 5;
SELECT replaceRegexpAll(trim(explain), '__table\d\.|__set_\d+_\d+|_subquery\d+|03457_filter', '')
FROM (
    EXPLAIN actions = 1
    SELECT * FROM 03457_data WHERE key GLOBAL NOT IN (SELECT * FROM 03457_filter WHERE key = 3)
)
WHERE explain LIKE '%Prewhere filter column: globalNotIn%';
