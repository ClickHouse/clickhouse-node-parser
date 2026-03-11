SELECT count()
FROM checksums_r1;

SELECT count()
FROM checksums_r2;

SELECT count()
FROM checksums_r3;

SELECT *
FROM `system`.text_log
WHERE event_time >= now() - toIntervalSecond(120)
    AND level == 'Error'
    AND like(message, '%CHECKSUM_DOESNT_MATCH%')
    AND like(logger_name, (concat('%', currentDatabase(), '%checksums_r%')));