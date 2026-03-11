SELECT arrayShuffle([]);

SELECT arrayShuffle([], 0xbadcafe);

SELECT arrayShuffle([9223372036854775808]);

SELECT arrayShuffle([9223372036854775808], 0xbadcafe);

SELECT arrayShuffle([1,2,3,4,5,6,7,8,9,10], 0xbadcafe);

SELECT arrayShuffle(materialize([1,2,3,4,5,6,7,8,9,10]), 0xbadcafe);

SELECT arrayShuffle([1,2,3,4,5,6,7,8,9,10.1], 0xbadcafe);

SELECT arrayShuffle([1,2,3,4,5,6,7,8,9,9223372036854775808], 0xbadcafe);

SELECT arrayShuffle([1,2,3,4,5,6,7,8,9,NULL], 0xbadcafe);

SELECT arrayShuffle([toFixedString('123', 3), toFixedString('456', 3), toFixedString('789', 3), toFixedString('ABC', 3), toFixedString('000', 3)], 0xbadcafe);

SELECT arrayShuffle([toFixedString('123', 3), toFixedString('456', 3), toFixedString('789', 3), toFixedString('ABC', 3), NULL], 0xbadcafe);

SELECT arrayShuffle(['storage','tiger','imposter','terminal','uniform','sensation'], 0xbadcafe);

SELECT arrayShuffle(['storage','tiger',NULL,'terminal','uniform','sensation'], 0xbadcafe);

SELECT arrayShuffle([NULL]);

SELECT arrayShuffle([NULL,NULL]);

SELECT arrayShuffle([[1,2,3,4],[-1,-2,-3,-4],[10,20,30,40],[100,200,300,400,500,600,700,800,900],[2,4,8,16,32,64]], 0xbadcafe);

SELECT arrayShuffle(materialize([[1,2,3,4],[-1,-2,-3,-4],[10,20,30,40],[100,200,300,400,500,600,700,800,900],[2,4,8,16,32,64]]), 0xbadcafe);

SELECT arrayShuffle([[1,2,3,4],[NULL,-2,-3,-4],[10,20,30,40],[100,200,300,400,500,600,700,800,900],[2,4,8,16,32,64]], 0xbadcafe);

SELECT arrayShuffle(groupArray(x), 0xbadcafe)
FROM (
        SELECT number AS x
        FROM `system`.numbers
        LIMIT 100
    );

SELECT arrayShuffle(groupArray(toUInt64(x)), 0xbadcafe)
FROM (
        SELECT number AS x
        FROM `system`.numbers
        LIMIT 100
    );

SELECT arrayShuffle([tuple(1, -1), tuple(99999999, -99999999), tuple(3, -3)], 0xbadcafe);

SELECT arrayShuffle([tuple(1, NULL), tuple(2, 'a'), tuple(3, 'A')], 0xbadcafe);

SELECT arrayPartialShuffle([]);

SELECT arrayPartialShuffle([], 0);

SELECT arrayPartialShuffle([], 0, 0xbadcafe);

SELECT arrayPartialShuffle([9223372036854775808]);

SELECT arrayPartialShuffle([9223372036854775808], 0);

SELECT arrayPartialShuffle([9223372036854775808], 0, 0xbadcafe);

SELECT arrayPartialShuffle([1,2,3,4,5,6,7,8,9,10], 0, 0xbadcafe);

SELECT arrayPartialShuffle([1,2,3,4,5,6,7,8,9,10.1], 0, 0xbadcafe);

SELECT arrayPartialShuffle([1,2,3,4,5,6,7,8,9,9223372036854775808], 0, 0xbadcafe);

SELECT arrayPartialShuffle([1,2,3,4,5,6,7,8,9,NULL], 0, 0xbadcafe);

SELECT arrayPartialShuffle([toFixedString('123', 3), toFixedString('456', 3), toFixedString('789', 3), toFixedString('ABC', 3), toFixedString('000', 3)], 0, 0xbadcafe);

SELECT arrayPartialShuffle([toFixedString('123', 3), toFixedString('456', 3), toFixedString('789', 3), toFixedString('ABC', 3), NULL], 0, 0xbadcafe);

SELECT arrayPartialShuffle(['storage','tiger','imposter','terminal','uniform','sensation'], 0, 0xbadcafe);

SELECT arrayPartialShuffle(['storage','tiger',NULL,'terminal','uniform','sensation'], 0, 0xbadcafe);

SELECT arrayPartialShuffle([NULL]);

SELECT arrayPartialShuffle([NULL,NULL]);

SELECT arrayPartialShuffle([[1,2,3,4],[-1,-2,-3,-4],[10,20,30,40],[100,200,300,400,500,600,700,800,900],[2,4,8,16,32,64]], 0, 0xbadcafe);

SELECT arrayPartialShuffle([[1,2,3,4],[NULL,-2,-3,-4],[10,20,30,40],[100,200,300,400,500,600,700,800,900],[2,4,8,16,32,64]], 0, 0xbadcafe);

SELECT arrayPartialShuffle(groupArray(x), 0, 0xbadcafe)
FROM (
        SELECT number AS x
        FROM `system`.numbers
        LIMIT 100
    );

SELECT arrayPartialShuffle(groupArray(toUInt64(x)), 0, 0xbadcafe)
FROM (
        SELECT number AS x
        FROM `system`.numbers
        LIMIT 100
    );

SELECT arrayPartialShuffle([tuple(1, -1), tuple(99999999, -99999999), tuple(3, -3)], 0, 0xbadcafe);

SELECT arrayPartialShuffle([tuple(1, NULL), tuple(2, 'a'), tuple(3, 'A')], 0, 0xbadcafe);

SELECT arrayPartialShuffle([NULL,NULL,NULL], 2);

SELECT arrayPartialShuffle([1,2,3,4,5,6,7,8,9,10], 1, 0xbadcafe);

SELECT arrayPartialShuffle([1,2,3,4,5,6,7,8,9,10], 2, 0xbadcafe);

SELECT arrayPartialShuffle([1,2,3,4,5,6,7,8,9,10], 4, 0xbadcafe);

SELECT arrayPartialShuffle([1,2,3,4,5,6,7,8,9,10], 8, 0xbadcafe);

SELECT arrayPartialShuffle([1,2,3,4,5,6,7,8,9,10], 9, 0xbadcafe);

SELECT arrayPartialShuffle([1,2,3,4,5,6,7,8,9,10], 10, 0xbadcafe);

SELECT arrayPartialShuffle([1,2,3,4,5,6,7,8,9,10], 100, 0xbadcafe);

SELECT arrayPartialShuffle([1,2,3,4,5,6,7,8,9,10.1], 4, 0xbadcafe);

SELECT arrayPartialShuffle([1,2,3,4,5,6,7,8,9,9223372036854775808], 4, 0xbadcafe);

SELECT arrayPartialShuffle([1,2,3,4,5,6,7,8,9,NULL], 4, 0xbadcafe);

SELECT arrayPartialShuffle([toFixedString('123', 3), toFixedString('456', 3), toFixedString('789', 3), toFixedString('ABC', 3), toFixedString('000', 3)], 3, 0xbadcafe);

SELECT arrayPartialShuffle([toFixedString('123', 3), toFixedString('456', 3), toFixedString('789', 3), toFixedString('ABC', 3), NULL], 3, 0xbadcafe);

SELECT arrayPartialShuffle(['storage','tiger','imposter','terminal','uniform','sensation'], 3, 0xbadcafe);

SELECT arrayPartialShuffle(['storage','tiger',NULL,'terminal','uniform','sensation'], 3, 0xbadcafe);

SELECT arrayPartialShuffle([[1,2,3,4],[-1,-2,-3,-4],[10,20,30,40],[100,200,300,400,500,600,700,800,900],[2,4,8,16,32,64]], 2, 0xbadcafe);

SELECT arrayPartialShuffle([[1,2,3,4],[NULL,-2,-3,-4],[10,20,30,40],[100,200,300,400,500,600,700,800,900],[2,4,8,16,32,64]], 2, 0xbadcafe);

SELECT arrayPartialShuffle(groupArray(x), 20, 0xbadcafe)
FROM (
        SELECT number AS x
        FROM `system`.numbers
        LIMIT 100
    );

SELECT arrayPartialShuffle(groupArray(toUInt64(x)), 20, 0xbadcafe)
FROM (
        SELECT number AS x
        FROM `system`.numbers
        LIMIT 100
    );

SELECT arrayPartialShuffle([tuple(1, -1), tuple(99999999, -99999999), tuple(3, -3)], 2, 0xbadcafe);

SELECT arrayPartialShuffle([tuple(1, NULL), tuple(2, 'a'), tuple(3, 'A')], 2, 0xbadcafe);

SELECT arrayShuffle([1, 2, 3], 42)
FROM numbers(10);

SELECT arrayShuffle(materialize([1, 2, 3]), 42)
FROM numbers(10);

SELECT arrayShuffle(1);

SELECT arrayShuffle([1], 'a');

SELECT arrayShuffle([1], 1.1);

SELECT arrayShuffle([1], 0xcafe, 1);