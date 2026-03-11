SELECT now64(if(NULL, NULL, if(NULL, nan, toFloat64(number))), NULL)
FROM numbers(2);