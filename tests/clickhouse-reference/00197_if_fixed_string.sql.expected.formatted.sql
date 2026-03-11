SELECT if(number % 2, toString(number), toString(negate(number)))
FROM `system`.numbers
LIMIT 10;

SELECT if(number % 2, toFixedString(toString(number), 2), toFixedString(toString(negate(number)), 2))
FROM `system`.numbers
LIMIT 10;

SELECT if(number % 2, toFixedString(toString(number), 2), toString(negate(number)))
FROM `system`.numbers
LIMIT 10;

SELECT if(number % 2, toString(number), toFixedString(toString(negate(number)), 2))
FROM `system`.numbers
LIMIT 10;

SELECT if(number % 2, toString(number), 'Hello')
FROM `system`.numbers
LIMIT 10;

SELECT if(number % 2, 'Hello', toString(negate(number)))
FROM `system`.numbers
LIMIT 10;

SELECT if(number % 2, 'Hello', 'Goodbye')
FROM `system`.numbers
LIMIT 10;

SELECT if(number % 2, toFixedString(toString(number), 2), 'Hello')
FROM `system`.numbers
LIMIT 10;

SELECT if(number % 2, 'Hello', toFixedString(toString(negate(number)), 2))
FROM `system`.numbers
LIMIT 10;