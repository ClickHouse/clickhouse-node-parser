SELECT if(number > 10, parseDateTime(materialize(''), '%d-%m-%Y'), '2020-01-01'::DateTime)
FROM numbers(2);