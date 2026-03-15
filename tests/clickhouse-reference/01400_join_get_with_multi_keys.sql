CREATE TABLE test_joinGet(a String, b String, c Float64) ENGINE = Join(any, left, a, b);
SELECT joinGet(test_joinGet, 'c', 'ab', '1');
CREATE TABLE test_lc(a LowCardinality(String), b LowCardinality(String), c Float64) ENGINE = Join(any, left, a, b);
SELECT joinGet(test_lc, 'c', 'ab', '1');
