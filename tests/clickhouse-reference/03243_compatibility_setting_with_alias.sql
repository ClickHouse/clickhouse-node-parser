SET enable_analyzer = DEFAULT;
SELECT name, value, changed from system.settings where name IN ('allow_experimental_analyzer', 'enable_analyzer') ORDER BY name;
SET compatibility = '24.8';
SET compatibility = '24.3';
SET compatibility = '24.1';
