SELECT arrayFold((acc, x) -> plus(acc, toString(NULL, toLowCardinality(toUInt128(4)), materialize(4), 'aaaa', materialize(4), 4, 4, 1), x), range(number), ((acc, x) -> if(x % 2, arrayPushFront(acc, x), arrayPushBack(acc, x))))
FROM `system`.numbers
LIMIT 0;