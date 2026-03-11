SELECT lowerUTF8('КВ АМ И СЖ');

SELECT upperUTF8('кв ам и сж');

SELECT lowerUTF8('КВ АМ И СЖ КВ АМ И СЖ');

SELECT upperUTF8('кв ам и сж кв ам и сж');

SELECT lowerUTF8(concat(repeat('0', 16), 'КВ АМ И СЖ'));

SELECT upperUTF8(concat(repeat('0', 16), 'кв ам и сж'));

SELECT lowerUTF8(concat(repeat('0', 48), 'КВ АМ И СЖ'));

SELECT upperUTF8(concat(repeat('0', 48), 'кв ам и сж'));