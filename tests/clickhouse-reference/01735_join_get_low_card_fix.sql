CREATE TABLE join_tbl (`id` String, `name` String, lcname LowCardinality(String)) ENGINE = Join(any, left, id);
SELECT joinGet('join_tbl', 'name', 'xxx') == 'yyy';
SELECT joinGet('join_tbl', 'name', toLowCardinality('xxx')) == 'yyy';
SELECT joinGet('join_tbl', 'name', toLowCardinality(materialize('xxx'))) == 'yyy';
SELECT joinGet('join_tbl', 'lcname', 'xxx') == 'yyy';
SELECT joinGet('join_tbl', 'lcname', toLowCardinality('xxx')) == 'yyy';
SELECT joinGet('join_tbl', 'lcname', toLowCardinality(materialize('xxx'))) == 'yyy';
