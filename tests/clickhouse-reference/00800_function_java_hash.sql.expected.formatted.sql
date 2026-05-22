-- Tags: no-fasttest
SELECT javaHash(toInt8(123));

SELECT javaHash(toInt8(-123));

SELECT javaHash(toInt16(123));

SELECT javaHash(toInt16(-123));

SELECT javaHash(toInt32(123));

SELECT javaHash(toInt32(-123));

SELECT javaHash(toInt64(123));

SELECT javaHash(toInt64(-123));

SELECT javaHash(toInt64(12345678901));

SELECT javaHash(toInt64(-12345678901));

SELECT javaHash('abc');

SELECT javaHash('874293087');

SELECT javaHashUTF16LE(convertCharset('a1가', 'utf-8', 'utf-16le'));

SELECT javaHashUTF16LE(convertCharset('가나다라마바사아자차카타파하', 'utf-8', 'utf-16le'));

SELECT javaHashUTF16LE(convertCharset('FJKLDSJFIOLD_389159837589429', 'utf-8', 'utf-16le'));

SELECT javaHashUTF16LE(convertCharset('𐐀𐐁𐐂𐐃𐐄', 'utf-8', 'utf-16le'));

SELECT hiveHash('abc');

SELECT hiveHash('874293087');