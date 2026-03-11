SELECT uniqMerge(Uniq) FROM stored_aggregates;
SELECT d, uniqMerge(Uniq) FROM stored_aggregates GROUP BY d ORDER BY d;
