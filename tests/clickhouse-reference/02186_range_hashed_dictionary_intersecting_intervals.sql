SELECT * FROM 02186_range_dictionary_source_table ORDER BY ALL;
SELECT * FROM 02186_range_dictionary;
select dictGet('02186_range_dictionary', 'value', toUInt64(1), toDate('2020-01-01'));
select dictGet('02186_range_dictionary', 'value', toUInt64(1), toDate('2020-01-02'));
select dictGet('02186_range_dictionary', 'value', toUInt64(1), toDate('2020-01-03'));
SELECT * FROM 02186_range_dictionary ORDER BY ALL;
