SELECT count()
FROM test_table;

SELECT *
FROM test_table FINAL
ORDER BY `ALL` ASC;

SELECT *
FROM test_table FINAL;

SELECT ' -- AggregatingMergeTree --\n'
FORMAT TSVRaw;

SELECT '\n\n -- CoalescingMergeTree --\n'
FORMAT TSVRaw;

SELECT
    vin,
    battery_level AS batt,
    lat AS lat,
    lon AS lon,
    firmware_version AS fw,
    cabin_temperature AS temp,
    speed_kmh AS speed
FROM electric_vehicle_state FINAL
ORDER BY vin ASC;