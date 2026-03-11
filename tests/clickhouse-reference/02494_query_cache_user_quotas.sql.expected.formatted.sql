SELECT
    'Run SELECT with quota that current user may use only 1 byte in the query cache',
    1
SETTINGS use_query_cache = true;

SELECT
    'Expect no entries in the query cache',
    count(*)
FROM `system`.query_cache;

SELECT
    'Run SELECT again but w/o quota',
    1
SETTINGS use_query_cache = true;

SELECT
    'Expect one entry in the query cache',
    count(*)
FROM `system`.query_cache;

SELECT '---';

SELECT
    'Run SELECT which writes its result in the query cache',
    1
SETTINGS use_query_cache = true;

SELECT
    'Run another SELECT with quota that current user may write only 1 entry in the query cache',
    1
SETTINGS use_query_cache = true;

SELECT
    'Run another SELECT w/o quota',
    1
SETTINGS use_query_cache = true;

SELECT
    'Expect two entries in the query cache',
    count(*)
FROM `system`.query_cache;