SELECT arraySort(arrayIntersect(arr, [1,2]))
FROM array_intersect
ORDER BY arr ASC;

SELECT arraySort(arrayIntersect(arr, []))
FROM array_intersect
ORDER BY arr ASC;

SELECT arraySort(arrayIntersect([], arr))
FROM array_intersect
ORDER BY arr ASC;

SELECT arraySort(arrayIntersect([1,2], arr))
FROM array_intersect
ORDER BY arr ASC;

SELECT arraySort(arrayIntersect([1,2], [1,2,3,4]))
FROM array_intersect
ORDER BY arr ASC;

SELECT arraySort(arrayIntersect([], []))
FROM array_intersect
ORDER BY arr ASC;

SELECT arraySort(arrayIntersect([-100], [156]));

SELECT arraySort(arrayIntersect([1], [257]));