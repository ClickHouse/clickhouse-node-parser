SELECT *
FROM explain_indexes;

SELECT arraySort(groupArray(id))
FROM tab
WHERE hasAnyTokens(message, ['foo']);

SELECT arraySort(groupArray(id))
FROM tab
WHERE hasAnyTokens(message, ['bar']);

SELECT arraySort(groupArray(id))
FROM tab
WHERE hasAnyTokens(message, ['foo', 'bar']);

SELECT arraySort(groupArray(id))
FROM tab
WHERE hasAnyTokens(message, ['foo', 'ba']);

SELECT arraySort(groupArray(id))
FROM tab
WHERE hasAnyTokens(message, ['fo', 'ba']);

SELECT arraySort(groupArray(id))
FROM tab
WHERE hasAllTokens(message, ['foo']);

SELECT arraySort(groupArray(id))
FROM tab
WHERE hasAllTokens(message, ['bar']);

SELECT arraySort(groupArray(id))
FROM tab
WHERE hasAllTokens(message, ['foo', 'bar']);

SELECT arraySort(groupArray(id))
FROM tab
WHERE hasAllTokens(message, ['abc', 'fo']);

SELECT arraySort(groupArray(id))
FROM tab
WHERE hasAnyTokens(message, ['bar$']);

SELECT arraySort(groupArray(id))
FROM tab
WHERE hasAnyTokens(message, tokens('bar$', 'splitByNonAlpha'));

SELECT arraySort(groupArray(id))
FROM tab
WHERE hasAllTokens(message, ['bar$']);

SELECT arraySort(groupArray(id))
FROM tab
WHERE hasAllTokens(message, tokens('bar$', 'splitByNonAlpha'));