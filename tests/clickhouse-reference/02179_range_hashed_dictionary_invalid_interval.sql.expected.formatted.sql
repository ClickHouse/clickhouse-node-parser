SELECT dictGet('02179_test_dictionary', 'value', 0, 15);

SELECT dictGet('02179_test_dictionary', 'value', 0, 5);

SELECT dictHas('02179_test_dictionary', 0, 15);

SELECT dictHas('02179_test_dictionary', 0, 5);

SELECT *
FROM `02179_test_dictionary`
ORDER BY `ALL` ASC;