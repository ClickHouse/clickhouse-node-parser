SELECT count(*)
FROM report_metrics_v2
WHERE (intDiv(a, 50) = 200)
    AND (intDiv(a, 50000) = 0);