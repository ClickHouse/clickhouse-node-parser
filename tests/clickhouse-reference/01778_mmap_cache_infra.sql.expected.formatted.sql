SET system_events_show_zero_values = 1;

SELECT event
FROM `system`.events
WHERE like(event, '%MMap%')
ORDER BY event ASC;

SELECT metric
FROM `system`.metrics
WHERE like(metric, '%MMap%')
ORDER BY metric ASC;