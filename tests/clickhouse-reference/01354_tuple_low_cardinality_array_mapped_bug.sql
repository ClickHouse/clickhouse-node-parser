SELECT arrayExists(x -> ((x.1) = 'pattern'), cast([tuple('a', 1)] as Array(Tuple(LowCardinality(String), UInt8))));
SELECT count(*) FROM table WHERE (arrayExists(x -> ((x.1) = toLowCardinality('pattern')), values) = 1);
