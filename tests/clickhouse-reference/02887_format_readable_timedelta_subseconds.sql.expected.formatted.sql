-- Check exception is thrown
SELECT formatReadableTimeDelta(1.1, 'seconds', 'hours'); -- { serverError BAD_ARGUMENTS }