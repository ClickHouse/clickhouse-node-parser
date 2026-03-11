SELECT
    if(number % 2, tuple(number), tuple(toString(number))) AS res,
    toTypeName(res)
FROM numbers(5);

SELECT
    if(number % 2, map(number, number), map(toString(number), toString(number))) AS res,
    toTypeName(res)
FROM numbers(5);