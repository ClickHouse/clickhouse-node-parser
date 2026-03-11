SELECT
    number,
    dictHas('simple_key_dictionary', number),
    dictGetOrNull('simple_key_dictionary', 'value', number),
    dictGetOrNull('simple_key_dictionary', 'value_nullable', number),
    dictGetOrNull('simple_key_dictionary', ('value', 'value_nullable'), number)
FROM system.numbers LIMIT 5;
SELECT
    (number, 'key'),
    dictHas('complex_key_dictionary', (number, 'key')),
    dictGetOrNull('complex_key_dictionary', 'value', (number, 'key')),
    dictGetOrNull('complex_key_dictionary', 'value_nullable', (number, 'key')),
    dictGetOrNull('complex_key_dictionary', ('value', 'value_nullable'), (number, 'key'))
FROM system.numbers LIMIT 5;
SELECT
    (number, toDate('2019-05-20')),
    dictHas('range_key_dictionary', number, toDate('2019-05-20')),
    dictGetOrNull('range_key_dictionary', 'value', number, toDate('2019-05-20')),
    dictGetOrNull('range_key_dictionary', 'value_nullable', number, toDate('2019-05-20')),
    dictGetOrNull('range_key_dictionary', ('value', 'value_nullable'), number, toDate('2019-05-20'))
FROM system.numbers LIMIT 5;
