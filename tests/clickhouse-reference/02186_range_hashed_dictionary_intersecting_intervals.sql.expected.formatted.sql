SELECT *
FROM `02186_range_dictionary_source_table`
ORDER BY `ALL` ASC;

SELECT *
FROM `02186_range_dictionary`;

SELECT dictGet('02186_range_dictionary', 'value', toUInt64(1), toDate('2020-01-01'));

SELECT dictGet('02186_range_dictionary', 'value', toUInt64(1), toDate('2020-01-02'));

SELECT dictGet('02186_range_dictionary', 'value', toUInt64(1), toDate('2020-01-03'));

SELECT *
FROM `02186_range_dictionary`
ORDER BY `ALL` ASC;