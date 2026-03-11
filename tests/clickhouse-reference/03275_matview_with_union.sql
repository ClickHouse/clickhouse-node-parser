SELECT count() FROM dst;
SELECT count(), key FROM dst WHERE step = 30 group by key ORDER BY key LIMIT 5;
