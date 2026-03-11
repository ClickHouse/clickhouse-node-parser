SELECT if(number % 2, tuple(number), tuple(toString(number))) as res, toTypeName(res) FROM numbers(5);
SELECT if(number % 2, map(number, number), map(toString(number), toString(number))) as res, toTypeName(res) FROM numbers(5);
