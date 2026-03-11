SELECT multiMatchAny('123', ['1']);

SELECT multiMatchAny('123', ['12']);

SELECT multiMatchAny('123', ['1', '2']);

SELECT multiMatchAnyIndex('123', ['1']);

SELECT multiMatchAnyIndex('123', ['12']);

SELECT multiMatchAnyIndex('123', ['1', '2']);

SELECT multiMatchAllIndices('123', ['1']);

SELECT multiMatchAllIndices('123', ['12']);

SELECT multiMatchAllIndices('123', ['1', '2']);

SELECT multiFuzzyMatchAny('123', 0, ['1']);

SELECT multiFuzzyMatchAny('123', 0, ['12']);

SELECT multiFuzzyMatchAny('123', 0, ['1', '2']);

SELECT multiFuzzyMatchAnyIndex('123', 0, ['1']);

SELECT multiFuzzyMatchAnyIndex('123', 0, ['12']);

SELECT multiFuzzyMatchAnyIndex('123', 0, ['1', '2']);

SELECT multiFuzzyMatchAllIndices('123', 0, ['1']);

SELECT multiFuzzyMatchAllIndices('123', 0, ['12']);

SELECT multiFuzzyMatchAllIndices('123', 0, ['1', '2']);

SELECT multiMatchAny(materialize('123'), materialize(['1']));

SELECT multiMatchAny(materialize('123'), materialize(['12']));

SELECT multiMatchAny(materialize('123'), materialize(['1', '2']));

SELECT multiMatchAnyIndex(materialize('123'), materialize(['1']));

SELECT multiMatchAnyIndex(materialize('123'), materialize(['12']));

SELECT multiMatchAnyIndex(materialize('123'), materialize(['1', '2']));

SELECT multiMatchAllIndices(materialize('123'), materialize(['1']));

SELECT multiMatchAllIndices(materialize('123'), materialize(['12']));

SELECT multiMatchAllIndices(materialize('123'), materialize(['1', '2']));

SELECT multiFuzzyMatchAny(materialize('123'), 0, materialize(['1']));

SELECT multiFuzzyMatchAny(materialize('123'), 0, materialize(['12']));

SELECT multiFuzzyMatchAny(materialize('123'), 0, materialize(['1', '2']));

SELECT multiFuzzyMatchAnyIndex(materialize('123'), 0, materialize(['1']));

SELECT multiFuzzyMatchAnyIndex(materialize('123'), 0, materialize(['12']));

SELECT multiFuzzyMatchAnyIndex(materialize('123'), 0, materialize(['1', '2']));

SELECT multiFuzzyMatchAllIndices(materialize('123'), 0, materialize(['1']));

SELECT multiFuzzyMatchAllIndices(materialize('123'), 0, materialize(['12']));

SELECT multiFuzzyMatchAllIndices(materialize('123'), 0, materialize(['1', '2']));