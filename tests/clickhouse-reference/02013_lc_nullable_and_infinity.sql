SELECT * FROM (SELECT dummy AS val FROM system.one) AS s1 ANY LEFT JOIN (SELECT toLowCardinality(dummy) AS rval FROM system.one) AS s2 ON (val + 9223372036854775806) = (rval * 1);
