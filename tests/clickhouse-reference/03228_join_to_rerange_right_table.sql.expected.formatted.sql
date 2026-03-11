SELECT
    MAX(test_right.a),
    count()
FROM
    test_left
INNER JOIN test_right
    ON test_left.b = test_right.b;

SELECT
    MAX(test_right.a),
    count()
FROM
    test_left
LEFT JOIN test_right
    ON test_left.b = test_right.b;