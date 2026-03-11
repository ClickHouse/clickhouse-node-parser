SELECT x FROM quorum1 ORDER BY x;
SELECT x FROM quorum2 ORDER BY x;
SELECT count(*) FROM system.parts WHERE active AND database = currentDatabase() AND table='quorum1';
-- and after we add new parts
SELECT sum(x) FROM quorum1;
SELECT sum(x) FROM quorum2;
