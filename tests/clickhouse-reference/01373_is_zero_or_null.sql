SELECT NOT x, isZeroOrNull(x) FROM (SELECT arrayJoin([1, 2, 3, NULL]) = 3 AS x);
SELECT '---';
SELECT NOT x, isZeroOrNull(x) FROM (SELECT arrayJoin([1, 2, 3]) = 3 AS x);
SELECT * FROM test WHERE x != 'xyz';
SELECT * FROM test WHERE NOT x = 'xyz';
SELECT * FROM test WHERE isZeroOrNull(x = 'xyz');
SELECT count() FROM
(
    SELECT * FROM test WHERE x != 'xyz'
    UNION ALL
    SELECT * FROM test WHERE NOT x != 'xyz'
);
SELECT count() FROM
(
    SELECT * FROM test WHERE x != 'xyz'
    UNION ALL
    SELECT * FROM test WHERE isZeroOrNull(x != 'xyz')
);
select isZeroOrNull(Null);
