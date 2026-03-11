SELECT _table
SETTINGS enable_analyzer = 0;

SELECT _table
FROM `system`.one
SETTINGS enable_analyzer = 0;

SELECT _table
SETTINGS enable_analyzer = 1;

SELECT _table
FROM `system`.one
SETTINGS enable_analyzer = 1;