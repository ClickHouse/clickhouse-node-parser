-- Check that 10e6 rows had been flushed from the query, not from the background worker.
SELECT count()
FROM buffer_;