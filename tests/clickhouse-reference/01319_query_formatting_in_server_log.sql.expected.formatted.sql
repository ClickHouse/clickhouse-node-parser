SELECT
    'ab
cd',
    /* hello */
    -- world
    1;

SET max_rows_to_read = 0; -- system.text_log can be really big

SELECT extract(message, 'SeL.+?;')
FROM `system`.text_log
WHERE event_date >= yesterday()
    AND like(message, '%SeLeCt ''ab\n%')
    AND logger_name = 'executeQuery'
ORDER BY event_time DESC
LIMIT 1
FORMAT TSVRaw;