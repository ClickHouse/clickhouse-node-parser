-- Should read local committed parts instead of throwing error code: 289. DB::Exception: Replica doesn't have part 20201216_1_1_0 which was successfully written to quorum of other replicas.
SELECT count()
FROM quorum1;

SELECT count()
FROM quorum2;

SELECT count()
FROM quorum3;