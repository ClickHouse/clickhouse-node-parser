SELECT count()
FROM binary_op_mono1
WHERE toDate(i / 1000) = '2020-09-02';

SELECT count()
FROM binary_op_mono2
WHERE 1000 / i = 100;

SELECT count()
FROM binary_op_mono3
WHERE i + 1000 = 500;

SELECT count()
FROM binary_op_mono4
WHERE 1000 + i = 500;

SELECT count()
FROM binary_op_mono5
WHERE i - 1000 = 1234;

SELECT count()
FROM binary_op_mono6
WHERE 1000 - i = 1234;

SELECT count()
FROM binary_op_mono7
WHERE i / 1000.0 = 22.3;

SELECT count()
FROM binary_op_mono8
WHERE 1000.0 / i = 33.4;

SELECT *
FROM x
WHERE i > 30; -- converted to i / 10 >= 3, thus needs to read 3 granules.