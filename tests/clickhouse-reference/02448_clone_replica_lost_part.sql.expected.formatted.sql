SELECT
    1,
    arraySort(groupArray(n))
FROM rmt2;

-- check that no parts are lost
SELECT
    2,
    arraySort(groupArray(n))
FROM rmt1;

SELECT
    3,
    arraySort(groupArray(n))
FROM rmt2;

-- give it a chance to remove source parts
SELECT sleep(2)
FORMAT Null; -- increases probability of reproducing the issue

SELECT
    4,
    arraySort(groupArray(n))
FROM rmt1;

-- check that no parts are lost
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

-- check that no parts are lost
SELECT
    8,
    arraySort(groupArray(n))
FROM rmt1;

SELECT
    9,
    arraySort(groupArray(n))
FROM rmt2;

-- give it a chance to cleanup log
SELECT sleepEachRow(2)
FROM url(concat('http://localhost:8123/?param_tries={1..10}&query=', encodeURLComponent(concat('select value from system.zookeeper where path=''/test/02448/', currentDatabase(), '/rmt/replicas/1'' and name=''is_lost'' and value=''0'''))), 'LineAsString', 's String')
SETTINGS
    max_threads = 1,
    http_make_head_request = 0
FORMAT Null;

-- rmt1 should not show the value (200) from dropped part
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