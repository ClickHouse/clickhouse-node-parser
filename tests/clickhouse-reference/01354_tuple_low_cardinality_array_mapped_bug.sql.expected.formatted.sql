SELECT arrayExists(x -> ((x.1) = 'pattern'), CAST([tuple('a', 1)] AS Array(Tuple(LowCardinality(String), UInt8))));

SELECT count(*)
FROM table
WHERE (arrayExists(x -> ((x.1) = toLowCardinality('pattern')), values) = 1);