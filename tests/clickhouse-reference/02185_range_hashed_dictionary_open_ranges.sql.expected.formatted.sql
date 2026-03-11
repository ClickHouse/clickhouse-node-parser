SELECT *
FROM `02185_range_dictionary_source_table`;

SELECT *
FROM `02185_range_dictionary`;

SELECT dictGet('02185_range_dictionary', 'value', 0, 0);

SELECT dictGet('02185_range_dictionary', 'value', 0, 5001);

SELECT dictGet('02185_range_dictionary', 'value', 0, 10001);

SELECT dictHas('02185_range_dictionary', 0, 0);

SELECT dictHas('02185_range_dictionary', 0, 5001);

SELECT dictHas('02185_range_dictionary', 0, 10001);