SELECT COUNT() FROM mutations_and_quorum1;
SELECT COUNT() FROM mutations_and_quorum2;
SELECT COUNT() FROM system.mutations WHERE database = currentDatabase() AND table like 'mutations_and_quorum%' and is_done = 0;
