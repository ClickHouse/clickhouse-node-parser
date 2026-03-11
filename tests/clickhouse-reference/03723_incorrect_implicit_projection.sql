SELECT
    type,
    count()
FROM prd_bid_events_simple_no_partition
WHERE date(timestamp) = '2025-11-01'
GROUP BY type
HAVING type = 'ad_request';
SELECT count()
FROM prd_bid_events_simple_no_partition
WHERE (date(timestamp) = '2025-11-01') AND (type = 'ad_request')
SETTINGS optimize_use_implicit_projections = 0;
SELECT
    count()
FROM prd_bid_events_simple_no_partition
WHERE (date(timestamp) = '2025-11-01') AND (type = 'ad_request')
SETTINGS optimize_use_implicit_projections = 1;
