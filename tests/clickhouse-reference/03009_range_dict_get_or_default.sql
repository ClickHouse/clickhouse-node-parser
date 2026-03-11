SELECT dictGetOrDefault('range_dictionary', 'value', toUInt64(2), toDate(toLowCardinality(materialize('2019-05-15'))), 2);
