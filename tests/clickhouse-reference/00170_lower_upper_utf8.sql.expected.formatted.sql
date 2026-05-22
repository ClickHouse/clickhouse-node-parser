-- Tags: no-fasttest
-- no-fasttest: upper/lowerUTF8 use ICU
SELECT lower('aaaaaaaaaaaaaaa012345789,.!aaaa' AS str) = str;

SELECT lowerUTF8('aaaaaaaaaaaaaaa012345789,.!aaaa' AS str) = str;

SELECT lower('AaAaAaAaAaAaAaA012345789,.!aAaA') = 'aaaaaaaaaaaaaaa012345789,.!aaaa';

SELECT lowerUTF8('AaAaAaAaAaAaAaA012345789,.!aAaA') = 'aaaaaaaaaaaaaaa012345789,.!aaaa';

SELECT upper('AAAAAAAAAAAAAAA012345789,.!AAAA' AS str) = str;

SELECT upperUTF8('AAAAAAAAAAAAAAA012345789,.!AAAA' AS str) = str;

SELECT upper('AaAaAaAaAaAaAaA012345789,.!aAaA') = 'AAAAAAAAAAAAAAA012345789,.!AAAA';

SELECT upperUTF8('AaAaAaAaAaAaAaA012345789,.!aAaA') = 'AAAAAAAAAAAAAAA012345789,.!AAAA';

SELECT sum(lower(materialize('aaaaaaaaaaaaaaa012345789,.!aaaa') AS str) = str) = count()
FROM
    `system`.one
ARRAY JOIN range(16384) AS n;

SELECT sum(lowerUTF8(materialize('aaaaaaaaaaaaaaa012345789,.!aaaa') AS str) = str) = count()
FROM
    `system`.one
ARRAY JOIN range(16384) AS n;

SELECT sum(lower(materialize('AaAaAaAaAaAaAaA012345789,.!aAaA')) = materialize('aaaaaaaaaaaaaaa012345789,.!aaaa')) = count()
FROM
    `system`.one
ARRAY JOIN range(16384) AS n;

SELECT sum(lowerUTF8(materialize('AaAaAaAaAaAaAaA012345789,.!aAaA')) = materialize('aaaaaaaaaaaaaaa012345789,.!aaaa')) = count()
FROM
    `system`.one
ARRAY JOIN range(16384) AS n;

SELECT sum(upper(materialize('AAAAAAAAAAAAAAA012345789,.!AAAA') AS str) = str) = count()
FROM
    `system`.one
ARRAY JOIN range(16384) AS n;

SELECT sum(upperUTF8(materialize('AAAAAAAAAAAAAAA012345789,.!AAAA') AS str) = str) = count()
FROM
    `system`.one
ARRAY JOIN range(16384) AS n;

SELECT sum(upper(materialize('AaAaAaAaAaAaAaA012345789,.!aAaA')) = materialize('AAAAAAAAAAAAAAA012345789,.!AAAA')) = count()
FROM
    `system`.one
ARRAY JOIN range(16384) AS n;

SELECT sum(upperUTF8(materialize('AaAaAaAaAaAaAaA012345789,.!aAaA')) = materialize('AAAAAAAAAAAAAAA012345789,.!AAAA')) = count()
FROM
    `system`.one
ARRAY JOIN range(16384) AS n;

SELECT lower('aaaaАБВГAAAAaaAA') = 'aaaaАБВГaaaaaaaa';

SELECT upper('aaaaАБВГAAAAaaAA') = 'AAAAАБВГAAAAAAAA';

SELECT lowerUTF8('aaaaАБВГAAAAaaAA') = 'aaaaабвгaaaaaaaa';

SELECT upperUTF8('aaaaАБВГAAAAaaAA') = 'AAAAАБВГAAAAAAAA';

SELECT sum(lower(materialize('aaaaАБВГAAAAaaAA')) = materialize('aaaaАБВГaaaaaaaa')) = count()
FROM
    `system`.one
ARRAY JOIN range(16384) AS n;

SELECT sum(upper(materialize('aaaaАБВГAAAAaaAA')) = materialize('AAAAАБВГAAAAAAAA')) = count()
FROM
    `system`.one
ARRAY JOIN range(16384) AS n;

SELECT sum(lowerUTF8(materialize('aaaaАБВГAAAAaaAA')) = materialize('aaaaабвгaaaaaaaa')) = count()
FROM
    `system`.one
ARRAY JOIN range(16384) AS n;

SELECT sum(upperUTF8(materialize('aaaaАБВГAAAAaaAA')) = materialize('AAAAАБВГAAAAAAAA')) = count()
FROM
    `system`.one
ARRAY JOIN range(16384) AS n;

-- Turkish language
SELECT upperUTF8('ır') = 'IR';

SELECT lowerUTF8('ır') = 'ır';

-- German language
SELECT upper('öäüß') = 'öäüß';

SELECT lower('ÖÄÜẞ') = 'ÖÄÜẞ';

-- Bug 68680
SELECT lengthUTF8(lowerUTF8('Ä\0'));