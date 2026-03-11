SELECT arraySort(groupArray(i))
FROM t
WHERE tuple(i, i) NOT IN (tuple(1, 2));

SELECT arraySort(groupArray(i))
FROM t
WHERE NOT has([tuple(1, 2)], (i, i));