SELECT count()
FROM data
WHERE notLike(str, 'a%')
SETTINGS force_primary_key = 1;

SELECT count()
FROM data
WHERE notLike(str, 'a%%')
SETTINGS force_primary_key = 1;

SELECT count()
FROM data
WHERE notLike(str, 'a')
SETTINGS force_primary_key = 1; -- { serverError INDEX_NOT_USED }

SELECT count()
FROM data
WHERE notLike(str, '%a')
SETTINGS force_primary_key = 1; -- { serverError INDEX_NOT_USED }

SELECT count()
FROM data
WHERE notLike(str, 'a_')
SETTINGS force_primary_key = 1; -- { serverError INDEX_NOT_USED }

SELECT count()
FROM data
WHERE notLike(str, 'a%_')
SETTINGS force_primary_key = 1; -- { serverError INDEX_NOT_USED }

SELECT count()
FROM data
WHERE notLike(str, '_a')
SETTINGS force_primary_key = 1; -- { serverError INDEX_NOT_USED }

SELECT count()
FROM data
WHERE notLike(str, 'a%\\_')
SETTINGS force_primary_key = 1; -- { serverError INDEX_NOT_USED }