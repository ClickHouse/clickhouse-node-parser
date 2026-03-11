SELECT if(number < 0, toFixedString(materialize('123'), 2), NULL)
FROM numbers(2);