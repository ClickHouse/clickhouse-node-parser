SELECT count() FROM checksums_r1;
SELECT count() FROM checksums_r2;
SELECT count() FROM checksums_r3;
SELECT * FROM system.text_log WHERE event_time >= now() - INTERVAL 120 SECOND and level == 'Error' and message like '%CHECKSUM_DOESNT_MATCH%' and logger_name like ('%' || currentDatabase() || '%checksums_r%');
