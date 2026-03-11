SELECT @@test;

SELECT @@max_allowed_packet
FORMAT CSVWithNames;

SELECT
    @@max_allowed_packet,
    number
FROM `system`.numbers
LIMIT 3
FORMAT CSVWithNames;

SELECT @@auto_increment_increment
FORMAT CSVWithNames;

SELECT globalVariable('auto_increment_increment') AS auto_increment_increment
FORMAT CSVWithNames;

SELECT @@Version
FORMAT CSVWithNames;