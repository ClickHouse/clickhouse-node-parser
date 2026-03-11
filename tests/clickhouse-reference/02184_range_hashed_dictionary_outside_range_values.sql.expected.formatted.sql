SELECT *
FROM `02184_range_dictionary`;

SELECT dictGet('02184_range_dictionary', ('value_0', 'value_1', 'value_2'), 1, 18446744073709551615);

SELECT dictHas('02184_range_dictionary', 1, 18446744073709551615);