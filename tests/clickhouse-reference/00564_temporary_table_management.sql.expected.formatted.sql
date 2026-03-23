-- Tags: memory-engine
SYSTEM DROP  TEMPORARY TABLE IF EXISTS temp_tab;

CREATE TEMPORARY TABLE temp_tab
(
    number UInt64
);

SYSTEM DROP  TEMPORARY TABLE temp_tab;