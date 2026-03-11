SELECT *
FROM tab
WHERE (mapContains(map1, 'key2') OR mapContains(map2, 'key2')) AND (NOT mapContains(map2, 'key3'))
ORDER BY id;
