SELECT uniq(bitNot(number))
FROM numbers(1);

SELECT sum(number + 1)
FROM numbers(1);

SELECT transform(number, [1, 2], ['google', 'censor.net'], 'other')
FROM numbers(1);

SELECT if(number > 0, 'censor.net', 'google')
FROM numbers(1);

SELECT uniq(bitNot(number))
FROM dist;

SELECT sum(number + 1)
FROM dist;

SELECT transform(number, [1, 2], ['google', 'censor.net'], 'other')
FROM dist;

SELECT if(number > 0, 'censor.net', 'google')
FROM dist;