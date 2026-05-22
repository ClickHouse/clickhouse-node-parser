-- The function reverses the sequence of UTF-8 code points (that is different from bytes or full characters):
SELECT reverseUTF8('привіт');

SELECT reverseUTF8('🇬🇧🌈');

SELECT reverseUTF8('🌈');

SELECT reverseUTF8('नमस्ते');