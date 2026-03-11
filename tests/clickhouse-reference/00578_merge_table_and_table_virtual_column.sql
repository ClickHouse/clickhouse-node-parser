SELECT count() FROM merge(currentDatabase(), '^numbers\\d+$');
SELECT DISTINCT count() FROM merge(currentDatabase(), '^numbers\\d+$') GROUP BY number;
SELECT count() FROM merge(currentDatabase(), '^numbers\\d+$') WHERE _table = 'numbers1';
SELECT count() FROM merge(currentDatabase(), '^numbers\\d+$') WHERE _table = 'numbers2';
SELECT count() FROM merge(currentDatabase(), '^numbers\\d+$') WHERE _table = 'numbers3';
SELECT count() FROM merge(currentDatabase(), '^numbers\\d+$') WHERE _table = 'non_existing';
