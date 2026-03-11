SELECT transform(number, [1], [toFloat32(1)], toFloat32(1))
FROM numbers(3);

SELECT '---';

SELECT transform(number, [3], [toFloat32(1)], toFloat32(1))
FROM numbers(6);