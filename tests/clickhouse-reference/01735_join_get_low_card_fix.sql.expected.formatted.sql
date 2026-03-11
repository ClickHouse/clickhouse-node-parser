SELECT joinGet('join_tbl', 'name', 'xxx') == 'yyy';

SELECT joinGet('join_tbl', 'name', toLowCardinality('xxx')) == 'yyy';

SELECT joinGet('join_tbl', 'name', toLowCardinality(materialize('xxx'))) == 'yyy';

SELECT joinGet('join_tbl', 'lcname', 'xxx') == 'yyy';

SELECT joinGet('join_tbl', 'lcname', toLowCardinality('xxx')) == 'yyy';

SELECT joinGet('join_tbl', 'lcname', toLowCardinality(materialize('xxx'))) == 'yyy';