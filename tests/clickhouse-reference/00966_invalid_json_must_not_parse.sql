SELECT JSONLength('"HX-=');
SELECT JSONLength('[9]\0\x42\xD3\x36\xE3');
SELECT JSONLength(unhex('5B30000E06D7AA5D'));
SELECT JSONLength('{"success"test:"123"}');
SELECT isValidJSON('{"success"test:"123"}');
