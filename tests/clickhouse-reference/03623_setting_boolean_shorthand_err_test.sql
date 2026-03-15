SELECT '-- Test against Boolean Setting';
SET optimize_on_insert;
SELECT getSetting('optimize_on_insert');
SET max_threads = 4;
SELECT getSetting('max_threads');
