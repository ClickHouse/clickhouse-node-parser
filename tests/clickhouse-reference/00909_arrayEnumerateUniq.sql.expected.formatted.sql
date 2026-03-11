SELECT arrayEnumerateUniq([1,1,2,2,1,1], [1,2,1,2,2,2]);

SELECT arrayEnumerateUniqRanked(1, [1,1,2,2,1,1], 1, [1,2,1,2,2,2], 1);

SELECT arrayEnumerateUniqRanked(1, [1,2,1], 1);

SELECT arrayEnumerateUniq([1,2,1]);

SELECT arrayEnumerateUniqRanked(1, ['a','b','c'], 1);

SELECT arrayEnumerateUniq(['a','b','c']);

SELECT arrayEnumerateUniqRanked(1, [1,2,1], 1, ['a','b','c'], 1);

SELECT arrayEnumerateUniq([1,2,1], ['a','b','c']);

SELECT arrayEnumerateUniqRanked(1, [1,2,1], 1, [[1,2,3],[2,2,1],[3]], 1);

SELECT arrayEnumerateUniq([1,2,1], [[1,2,3],[2,2,1],[3]]);

SELECT arrayEnumerateUniqRanked(1, [['a','b','a'],['a','b','a'],['c']], 1);

SELECT arrayEnumerateUniq([['a','b','a'],['a','b','a'],['c']]);

SELECT arrayEnumerateUniqRanked(1, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 1);

SELECT arrayEnumerateUniq([[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]]);

SELECT arrayEnumerateUniqRanked(1, [[1,2,3],[2,2,1],[3]], 2);

SELECT arrayEnumerateUniqRanked(1, [['a','b','a'],['a','b','a'],['c']], 2);

SELECT arrayEnumerateUniqRanked(1, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 2);

SELECT arrayEnumerateUniqRanked(1, [[1,2,3],[2,2,1],[3]], 2, [['a','b','a'],['a','b','a'],['c']], 2);

SELECT arrayEnumerateUniqRanked(1, [[1,2,3],[2,2,1],[3]], 2, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 2);

SELECT arrayEnumerateUniqRanked(1, [1,2,1], 1, [[1,2,3],[2,2,1],[3]], 2);

SELECT arrayEnumerateUniqRanked(1, ['a','b','c'], 1, [[1,2,3],[2,2,1],[3]], 2);

SELECT arrayEnumerateUniqRanked(1, [1,2,1], 1, [['a','b','a'],['a','b','a'],['c']], 2);

SELECT arrayEnumerateUniqRanked(1, ['a','b','c'], 1, [['a','b','a'],['a','b','a'],['c']], 2);

SELECT arrayEnumerateUniqRanked(1, [1,2,1], 1, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 2);

SELECT arrayEnumerateUniqRanked(1, [1,2,1], 1, ['a','b','c'], 1, [[1,2,3],[2,2,1],[3]], 2);

SELECT arrayEnumerateUniqRanked(1, [1,2,1], 1, [[1,2,3],[2,2,1],[3]], 2, [['a','b','a'],['a','b','a'],['c']], 2);

SELECT arrayEnumerateUniqRanked(1, [[1,2,3],[2,2,1],[3]], 1, [['a','b','a'],['a','b','a'],['c']], 2);

SELECT arrayEnumerateUniqRanked(1, [[1,2,3],[2,2,1],[3]], 2, [['a','b','a'],['a','b','a'],['c']], 1);

SELECT arrayEnumerateUniqRanked(2, [[1,2,3],[2,2,1],[3]], 2);

SELECT arrayEnumerateUniqRanked(2, [['a','b','a'],['a','b','a'],['c']], 2);

SELECT arrayEnumerateUniqRanked(2, [[1,2,3],[2,2,1],[3]], 2, [['a','b','a'],['a','b','a'],['c']], 2);

SELECT arrayEnumerateUniqRanked(2, [[1,2,3],[2,2,1],[3]], 2, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 2);

SELECT arrayEnumerateUniqRanked(2, [1,2,1], 1, [[1,2,3],[2,2,1],[3]], 2);

SELECT arrayEnumerateUniqRanked(2, [1,2,1], 1, [['a','b','a'],['a','b','a'],['c']], 2);

SELECT arrayEnumerateUniqRanked(2, [1,2,1], 1, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 2);

SELECT arrayEnumerateUniqRanked(2, [[1,2,3],[2,2,1],[3]], 1, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 2);

SELECT arrayEnumerateUniqRanked(2, [[1,2,3],[2,2,1],[3]], 2, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 3);

SELECT arrayEnumerateUniqRanked(2, [[1,2,3],[2,2,1],[3]], [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]]);

SELECT arrayEnumerateUniqRanked(3, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 3);

SELECT arrayEnumerateUniqRanked(2, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 3);

SELECT arrayEnumerateUniqRanked(1, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 3);

SELECT arrayEnumerateUniqRanked([[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]]);

SELECT '---------Dense';

SELECT arrayEnumerateDenseRanked(1, [10,20,10,30], 1);

SELECT arrayEnumerateDense([10,20,10,30]);

SELECT arrayEnumerateDenseRanked(3, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 3);

SELECT arrayEnumerateDenseRanked(2, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 3);

SELECT arrayEnumerateDenseRanked(1, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 3);

SELECT arrayEnumerateDenseRanked(2, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 2);

SELECT arrayEnumerateDenseRanked(1, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 2);

SELECT arrayEnumerateDenseRanked(1, [[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]],[[1,2]]], 1);

SELECT *
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    '1,a1,1',
    arrayEnumerateUniqRanked(1, a1, 1)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    '1,a2,1',
    arrayEnumerateUniqRanked(1, a2, 1)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    '1,a3,1',
    arrayEnumerateUniqRanked(1, a3, 1)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    '1,a4,1',
    arrayEnumerateUniqRanked(1, a4, 1)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    '1,a1,1,a2,1',
    arrayEnumerateUniqRanked(1, a1, 1, a2, 1)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT arrayEnumerateUniq(a1, a2)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    '1,a3,1,a4,1',
    arrayEnumerateUniqRanked(1, a3, 1, a4, 1)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    '1,a3,2,a4,1',
    arrayEnumerateUniqRanked(1, a3, 2, a4, 1)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    '1,a3,1,a4,2',
    arrayEnumerateUniqRanked(1, a3, 1, a4, 2)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    '1,a3,2,a4,2',
    arrayEnumerateUniqRanked(1, a3, 2, a4, 2)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    '2,a3,2,a4,2',
    arrayEnumerateUniqRanked(2, a3, 2, a4, 2)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    '2,a3,2,a4,1',
    arrayEnumerateUniqRanked(2, a3, 2, a4, 1)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    '2,a3,1,a4,2',
    arrayEnumerateUniqRanked(2, a3, 1, a4, 2)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    'a3,a4 1..n',
    arrayEnumerateUniqRanked(a3, a4)
FROM arrays_test
ORDER BY
    a3 ASC,
    a4 ASC;

SELECT
    'a3,a4 1..1',
    arrayEnumerateUniqRanked(a3, a4)
FROM arrays_test
ORDER BY
    a3 ASC,
    a4 ASC;

SELECT arrayEnumerateUniqRanked();

SELECT arrayEnumerateUniqRanked([]);

SELECT arrayEnumerateUniqRanked(1);

SELECT arrayEnumerateUniqRanked(2, []);

SELECT arrayEnumerateUniqRanked(2, [], 2);

SELECT arrayEnumerateUniqRanked(2, [], []);

SELECT arrayEnumerateUniqRanked(2, [], [], 3);

SELECT arrayEnumerateUniqRanked([], 2);

SELECT arrayEnumerateUniqRanked([], 2, []);

SELECT arrayEnumerateUniqRanked(0, [], 0);

SELECT arrayEnumerateUniqRanked(0, 0, 0);

SELECT arrayEnumerateUniqRanked(1, 1, 1);

SELECT arrayEnumerateDenseRanked(1, [10,20,10,30], 0);

SELECT arrayEnumerateUniqRanked(1, [[7,8,9,10],[10,11,12]], 2, [[14,15,16],[17,18,19],[20],[21]], 2);

SELECT arrayEnumerateUniqRanked(1, [1,2], 1, ['a', 'b', 'c', 'd'], 1);

SELECT arrayEnumerateUniqRanked(1, [1,2], 1, [14,15,16,17,18,19], 1);

SELECT arrayEnumerateUniqRanked(1, [14,15,16,17,18,19], 1, [1,2], 1);

SELECT arrayEnumerateUniqRanked(1, [1,1,1,1,1,1], 1, [1,1], 1);

SELECT arrayEnumerateUniqRanked(1, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], 1, [1,1], 1);

SELECT arrayEnumerateDenseRanked([], [], []);

SELECT arrayEnumerateDenseRanked([], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []);

SELECT arrayEnumerateDenseRanked([1,2], [1,2], [1,2]);

SELECT arrayEnumerateUniqRanked([1,2], [1,2], [1,2]);

SELECT arrayEnumerateUniqRanked([1,2], 3, 4, 5);

SELECT arrayEnumerateUniqRanked([1,2], 1, 2);

SELECT arrayEnumerateUniqRanked([1,2], 1, 3, 4, 5);

SELECT arrayEnumerateUniqRanked([1,2], 1, 3, [4], 5);

SELECT arrayEnumerateDenseRanked([[[[[[[[[[42]]]]]]]]]]);

SELECT arrayEnumerateUniqRanked('wat', [1,2]);

SELECT arrayEnumerateUniqRanked(1, [1,2], 'boom');

SELECT arrayEnumerateDenseRanked(['\0'], -8363126);

SELECT arrayEnumerateDenseRanked(-10, ['\0'], -8363126);

SELECT arrayEnumerateDenseRanked(1, ['\0'], -8363126);

SELECT arrayEnumerateDenseRanked(-101, ['\0']);

SELECT arrayEnumerateDenseRanked(1.1, [10,20,10,30]);

SELECT arrayEnumerateDenseRanked([10,20,10,30], 0.4);

SELECT arrayEnumerateDenseRanked([10,20,10,30], 1.8);

SELECT arrayEnumerateUniqRanked(1, [], 1000000000);

SELECT arrayEnumerateUniqRanked(2, [[3], [3]]);

SELECT arrayEnumerateUniqRanked(2, [[], [3], [3]]);

SELECT arrayEnumerateUniqRanked(2, [[], [], [], [3], [], [3]]);

SELECT arrayEnumerateUniqRanked(2, [[], [], [], [], [3], [3]]);

SELECT arrayEnumerateUniqRanked(2, [[3], [], [3]]);

SELECT arrayEnumerateUniqRanked(2, [[3], [], [], [3]]);

SELECT arrayEnumerateUniqRanked(2, [[3], [], [], [3], [3]]);

SELECT *
FROM (
        SELECT
            a,
            arrayEnumerateUniqRanked(a)
        FROM (
                SELECT *
                FROM (
                        SELECT [[], [1, 2, 3, 4]] AS a
                        UNION ALL
                        SELECT [[3, 4, 5]] AS a
                    )
            )
    )
ORDER BY a ASC;

SELECT
    a,
    arrayEnumerateUniqRanked(a)
FROM (
        SELECT *
        FROM (
                SELECT [[1, 2, 3, 4]] AS a
                UNION ALL
                SELECT [[3, 4, 5]] AS a
            )
        ORDER BY a ASC
    );

SELECT
    a,
    arrayEnumerateUniqRanked(a)
FROM (
        SELECT *
        FROM (
                SELECT [[], [1, 2, 3, 4]] AS a
                UNION ALL
                SELECT [[], [3, 4, 5]] AS a
            )
        ORDER BY a ASC
    );

SELECT
    a,
    arrayEnumerateUniqRanked(a)
FROM (
        SELECT *
        FROM (
                SELECT [[6], [1, 2, 3, 4]] AS a
                UNION ALL
                SELECT [[3, 4, 5]] AS a
            )
        ORDER BY a ASC
    );

SELECT
    a,
    arrayEnumerateUniqRanked(a)
FROM (
        SELECT *
        FROM (
                SELECT [[], [1, 2, 3, 4]] AS a
                UNION ALL
                SELECT [[3, 4, 5]] AS a
            )
        ORDER BY a ASC
    );

SELECT arrayEnumerateUniqRanked(2, [[1, 2, 3, 4], [3, 4, 5, 6]]);

SELECT arrayEnumerateUniqRanked(2, [[], [1, 2, 3, 4], [3, 4, 5, 6]]);

SELECT arrayEnumerateUniqRanked(2, [[], [1, 2, 3, 4], [], [], [3, 4, 5, 6]]);

SELECT arrayEnumerateUniqRanked(2, [[1, 2, 3, 4], [], [], [3, 4, 5, 6]]);

SELECT arrayEnumerateUniqRanked(2, [[1], [1]]);

SELECT arrayEnumerateUniqRanked(2, [[], [1], [1]]);

SELECT
    a,
    arrayEnumerateUniqRanked(a)
FROM (
        SELECT *
        FROM (
                SELECT [[], [4]] AS a
                UNION ALL
                SELECT [[4]] AS a
            )
        ORDER BY a ASC
    );

SELECT
    a,
    arrayEnumerateUniqRanked(a)
FROM (
        SELECT *
        FROM (
                SELECT [[], [], [1, 2, 3, 4]] AS a
                UNION ALL
                SELECT [[3, 4, 5]] AS a
            )
        ORDER BY a ASC
    );

SELECT
    a,
    arrayEnumerateUniqRanked(a)
FROM (
        SELECT *
        FROM (
                SELECT [[], [], [1, 2, 3, 4]] AS a
                UNION ALL
                SELECT [[], [], [3, 4, 5]] AS a
            )
        ORDER BY a ASC
    );

SELECT
    a,
    arrayEnumerateUniqRanked(a)
FROM (
        SELECT *
        FROM (
                SELECT [[], [], [1, 2, 1, 4]] AS a
                UNION ALL
                SELECT [[], [], [3, 4, 5, 4]] AS a
            )
        ORDER BY a ASC
    );

SELECT
    'a1,a2 n',
    arrayEnumerateUniqRanked(a1, a2)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    'a1,a2 1',
    arrayEnumerateUniqRanked(a1, a2)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    'a1,a2 n2',
    arrayEnumerateUniqRanked(a1, a2)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    'a1,a2 12',
    arrayEnumerateUniqRanked(a1, a2)
FROM arrays_test
ORDER BY
    a1 ASC,
    a2 ASC;

SELECT
    CounterID,
    StartDate,
    Sign,
    VisitID,
    UserID,
    VisitVersion,
    BannerID,
    Load,
    PuidKeyArr,
    PuidValArr,
    arrayEnumerateUniqRanked(PuidKeyArr, PuidValArr) AS uniqTestPuid
FROM
    arr_tests_visits
ARRAY JOIN Test.BannerID AS BannerID, Test.Load AS Load, Test.PuidKey AS PuidKeyArr, Test.PuidVal AS PuidValArr;

SELECT arrayEnumerateUniqRanked([['a'], [], ['a']]);

SELECT arrayEnumerateUniqRanked([[1], [], [1]]);

SELECT arrayEnumerateUniqRanked([[1], [], [1], [], [1], [], [1], [], [1], [], [1], [], [1], [], [1], [], [1]]);

SELECT arrayEnumerateUniqRanked([[], [1], [], [1], [], [1], [], [1], [], [1], [], [1], [], [1], [], [1]]);

SELECT arrayEnumerateUniqRanked([[1], [1], [], [1]]);

SELECT
    a,
    arrayEnumerateUniqRanked(a)
FROM (
        SELECT *
        FROM (
                SELECT [[],[1],[]] AS a
                UNION ALL
                SELECT [[1]] AS a
            )
        ORDER BY a ASC
    );