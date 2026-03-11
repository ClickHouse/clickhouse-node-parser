SELECT h3ToChildren(599405990164561919, 16);

SELECT arraySort(h3ToChildren(h3_index, res))
FROM h3_indexes
ORDER BY res ASC;