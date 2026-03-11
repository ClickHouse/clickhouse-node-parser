SELECT count() FROM pk_set WHERE host IN ('admin.market1', 'admin.market2') AND code = 100;
SELECT count() FROM pk_set WHERE host IN ('admin.market1', 'admin.market2') AND code = 100 AND n = 11;
SELECT count() FROM pk_set WHERE host IN ('admin.market1', 'admin.market2') AND code = 100 AND n >= 11;
SELECT count() FROM pk_set WHERE host IN ('market', 'admin.market2', 'admin.market3', 'admin.market4', 'abc') AND code = 100 AND n = 11;
SELECT count() FROM pk_set WHERE host IN ('market', 'admin.market2', 'admin.market3', 'admin.market4', 'abc') AND code = 100 AND n >= 11;
SELECT count() FROM pk_set WHERE host IN ('admin.market2', 'admin.market3', 'admin.market4', 'abc') AND code = 100 AND n = 11;
SELECT count() FROM pk_set WHERE host IN ('admin.market2', 'admin.market3', 'admin.market4', 'abc', 'news') AND code = 100 AND n = 11;
