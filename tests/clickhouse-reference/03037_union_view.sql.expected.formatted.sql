SELECT
    v.start,
    v.total_sec
FROM broken_view AS v FINAL
WHERE isNotNull(v.start);