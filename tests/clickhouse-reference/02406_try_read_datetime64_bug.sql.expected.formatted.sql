SELECT toDateTime64OrDefault('Aaaa e a.a.aaaaaaaaa', 9, 'UTC');

DESCRIBE TABLE format(CSV, '"Aaaa e a.a.aaaaaaaaa"');