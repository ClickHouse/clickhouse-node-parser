SELECT
    1,
    arraySort(groupArray(n))
FROM rmt2;

SELECT
    2,
    arraySort(groupArray(n))
FROM rmt1;

SELECT
    3,
    arraySort(groupArray(n))
FROM rmt2;

SELECT sleep(2)
FORMAT Null;

SELECT
    4,
    arraySort(groupArray(n))
FROM rmt1;

SELECT
    5,
    arraySort(groupArray(n))
FROM rmt1;

SELECT
    6,
    arraySort(groupArray(n))
FROM rmt2;

SELECT
    7,
    arraySort(groupArray(n))
FROM rmt2;

SELECT
    8,
    arraySort(groupArray(n))
FROM rmt1;

SELECT
    9,
    arraySort(groupArray(n))
FROM rmt2;

SELECT sleepEachRow(2)
FROM url(concat('http://localhost:8123/?param_tries={1..10}&query=', encodeURLComponent(concat('select value from system.zookeeper where path=''/test/02448/', currentDatabase(), '/rmt/replicas/1'' and name=''is_lost'' and value=''0'''))), 'LineAsString', 's String')
SETTINGS
    max_threads = 1,
    http_make_head_request = 0
FORMAT Null;

SELECT throwIf(n = 200)
FROM rmt1
FORMAT Null;

SELECT
    11,
    arraySort(groupArray(n))
FROM rmt2;

SELECT
    12,
    arraySort(groupArray(n))
FROM rmt1;