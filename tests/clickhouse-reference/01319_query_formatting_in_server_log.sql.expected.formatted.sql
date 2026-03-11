SELECT
    'ab
cd',
    1;

SELECT extract(message, 'SeL.+?;')
FROM `system`.text_log
WHERE event_date >= yesterday()
    AND like(message, '%SeLeCt ''ab\n%')
    AND logger_name = 'executeQuery'
ORDER BY event_time DESC
LIMIT 1
FORMAT TSVRaw;