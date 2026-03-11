SELECT transform(number, [2, 4, 6], ['google', 'censor.net', 'yahoo'], 'other')
FROM `system`.numbers
LIMIT 10;

SELECT if(number > 5, 'censor.net', 'google')
FROM `system`.numbers
LIMIT 10;