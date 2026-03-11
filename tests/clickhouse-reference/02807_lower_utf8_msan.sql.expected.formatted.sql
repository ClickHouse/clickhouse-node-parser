SELECT lowerUTF8(arrayJoin(['©--------------------------------------', '©--------------------']))
ORDER BY 1 ASC;

SELECT upperUTF8(materialize('aaaaАБВГaaaaaaaaaaaaАБВГAAAAaaAA'))
FROM numbers(2);