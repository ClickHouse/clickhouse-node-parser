SELECT positionCaseInsensitiveUTF8('иголка.ру', 'иголка.р�\0') AS res;

SELECT sum(ignore(positionCaseInsensitiveUTF8('иголка.ру', randomString(rand() % 2))))
FROM numbers(1000000);