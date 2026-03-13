SELECT *
FROM merge(currentDatabase(), '^numbers\\d+$') SAMPLE 0.1; -- { serverError SAMPLING_NOT_SUPPORTED }

SELECT *
FROM merge(currentDatabase(), '^numbers\\d+$') SAMPLE 0.01;