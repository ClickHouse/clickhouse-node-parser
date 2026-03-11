SeLeCt 'ab
cd' /* hello */ -- world
, 1;
SELECT extract(message, 'SeL.+?;') FROM system.text_log WHERE event_date >= yesterday() AND message LIKE '%SeLeCt \'ab\n%' and logger_name = 'executeQuery' ORDER BY event_time DESC LIMIT 1 FORMAT TSVRaw;
