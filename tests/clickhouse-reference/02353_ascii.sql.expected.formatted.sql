SELECT ascii('234');

SELECT ascii('');

SELECT ascii(materialize('234'));

SELECT ascii(materialize(''));

SELECT ascii(concat(toString(number), 'abc'))
FROM numbers(10);