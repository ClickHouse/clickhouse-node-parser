SELECT if(number % 2, number::Dynamic(max_types=3), ('str_' || toString(number))::Dynamic(max_types=2)) AS d, toTypeName(d), dynamicType(d) FROM numbers(4);
SELECT * FROM (SELECT d, dynamicType(d) FROM dynamic_test_1 UNION ALL SELECT d, dynamicType(d) FROM dynamic_test_2) order by d;
