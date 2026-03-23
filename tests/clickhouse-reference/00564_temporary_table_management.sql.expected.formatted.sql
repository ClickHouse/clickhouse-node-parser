-- Tags: memory-engine
DROP TEMPORARY TABLE IF EXISTS temp_tab;

CREATE TEMPORARY TABLE temp_tab
(
    number UInt64
);

DROP TEMPORARY TABLE temp_tab;