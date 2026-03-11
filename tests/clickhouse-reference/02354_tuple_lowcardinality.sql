SELECT toTypeName(tuple(toLowCardinality('1'), toLowCardinality(1)));
SELECT toTypeName(tuple(materialize(toLowCardinality('1')), toLowCardinality(1)));
SELECT toTypeName(tuple(toLowCardinality('1'), materialize(toLowCardinality(1))));
SELECT toTypeName(tuple(materialize(toLowCardinality('1')), materialize(toLowCardinality(1))));
