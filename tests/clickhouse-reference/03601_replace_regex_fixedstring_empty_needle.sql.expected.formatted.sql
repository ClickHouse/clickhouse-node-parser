SELECT replaceRegexpAll(materialize(toFixedString(toLowCardinality(concat('z', number)), 2)), '', 'aazzqa')
FROM numbers(10);