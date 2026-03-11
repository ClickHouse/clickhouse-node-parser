SELECT dictGetOrDefault('cache_dictionary_complex_key_simple_attributes_short_circuit', 'value_first', (number, concat(toString(number))), toString(materialize('default'))) AS value_first
FROM `system`.numbers
LIMIT 20
FORMAT Null;