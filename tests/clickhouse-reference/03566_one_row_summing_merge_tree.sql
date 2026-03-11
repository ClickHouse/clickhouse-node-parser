SELECT count() FROM test_table;
SELECT * FROM test_table FINAL ORDER BY ALL;
select * from test_table final;
select ' -- AggregatingMergeTree --\n' format TSVRaw;
select '\n\n -- CoalescingMergeTree --\n' format TSVRaw;
SELECT
    vin,
    battery_level AS batt,
    lat AS lat,
    lon AS lon,
    firmware_version AS fw,
    cabin_temperature AS temp,
    speed_kmh AS speed
FROM electric_vehicle_state FINAL
ORDER BY vin;
