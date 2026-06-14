SET max_parser_depth = 4000;

SELECT x
FROM (
        SELECT if(number % 16 = 0, nan, (if(number % 24 = 0, NULL, (if(number % 37 = 0, nan, (if(number % 34 = 0, nan, (if(number % 3 = 0, NULL, (if(number % 68 = 0, 42, (if(number % 28 = 0, nan, (if(number % 46 = 0, nan, (if(number % 13 = 0, nan, (if(number % 27 = 0, NULL, (if(number % 39 = 0, NULL, (if(number % 27 = 0, NULL, (if(number % 30 = 0, NULL, (if(number % 72 = 0, NULL, (if(number % 36 = 0, NULL, (if(number % 51 = 0, NULL, (if(number % 58 = 0, nan, (if(number % 26 = 0, 42, (if(number % 13 = 0, nan, (if(number % 12 = 0, NULL, (if(number % 22 = 0, nan, (if(number % 36 = 0, NULL, (if(number % 63 = 0, NULL, (if(number % 27 = 0, NULL, (if(number % 18 = 0, NULL, (if(number % 69 = 0, NULL, (if(number % 76 = 0, nan, (if(number % 42 = 0, NULL, (if(number % 9 = 0, NULL, (toFloat64(number))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) AS x
        FROM `system`.numbers
        LIMIT 1001
    )
ORDER BY x ASC NULLS FIRST;

SELECT x
FROM (
        SELECT if(number % 22 = 0, nan, (if(number % 56 = 0, 42, (if(number % 45 = 0, NULL, (if(number % 47 = 0, 42, (if(number % 39 = 0, NULL, (if(number % 1 = 0, nan, (if(number % 43 = 0, nan, (if(number % 40 = 0, nan, (if(number % 42 = 0, NULL, (if(number % 26 = 0, 42, (if(number % 41 = 0, 42, (if(number % 6 = 0, NULL, (if(number % 39 = 0, NULL, (if(number % 34 = 0, nan, (if(number % 74 = 0, 42, (if(number % 40 = 0, nan, (if(number % 37 = 0, nan, (if(number % 51 = 0, NULL, (if(number % 46 = 0, nan, (toFloat64(number))))))))))))))))))))))))))))))))))))))) AS x
        FROM `system`.numbers
        LIMIT 1001
    )
ORDER BY x ASC NULLS FIRST;