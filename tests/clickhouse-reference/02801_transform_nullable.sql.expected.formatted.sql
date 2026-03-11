SELECT transform('a', ['a', 'b'], [toDateTime64(1, 3, 'UTC'), toDateTime64(2, 3, 'UTC')], toDateTime64(0, 3, 'UTC'));

SELECT transform(2, [1, 2], [toDateTime64(1, 3, 'UTC'), toDateTime64(2, 3, 'UTC')], toDateTime64(0, 3, 'UTC'));

SELECT transform(NULL, [1, 2], [toDateTime64(1, 3, 'UTC'), toDateTime64(2, 3, 'UTC')], toDateTime64(0, 3, 'UTC'));

SELECT transform(number, [3, 5, 7], ['hello', 'world', 'abc'], NULL)
FROM `system`.numbers
LIMIT 10;

SELECT transform(NULL, ['3', '5', '7'], ['hello', 'world', 'abc'], NULL)
FROM `system`.numbers
LIMIT 10;

SELECT transform(NULL, [null, null, null], [null, null, null], NULL)
FROM `system`.numbers
LIMIT 10;

SELECT transform(toString(number), ['3', '5', '7'], [111, 222, null], -1)
FROM `system`.numbers
LIMIT 10;

SELECT transform(toString(number), ['3', '5', '7'], [null, 222, 333], materialize(-1.1))
FROM `system`.numbers
LIMIT 10;

SELECT transform(toString(number), ['3', '5', '7'], [null, null, null], materialize(1))
FROM `system`.numbers
LIMIT 10;

SELECT transform(1, [2, 3], ['Meta.ua', null], materialize('Остальные')) AS title;

SELECT transform(2, [2, 3], [null, 'Google'], materialize('Остальные')) AS title;

SELECT transform(if(number % 3 = 1, NULL, number), [2, 5, NULL], ['Hello', 'World', 'xyz'], '-')
FROM numbers(10);