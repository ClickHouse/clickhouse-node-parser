SELECT translate('Hello? world.', '.?', '!,');

SELECT translate('gtcttgcaag', 'ACGTacgt', 'TGCAtgca');

SELECT translate(toString(number), '0123456789', 'abcdefghij')
FROM numbers(987654, 5);

SELECT translateUTF8('HôtelGenèv', 'Ááéíóúôè', 'aaeiouoe');

SELECT translateUTF8('中文内码', '久标准中文内码', 'ユニコードとは');

SELECT translateUTF8(toString(number), '1234567890', 'ዩय𐑿𐐏নՅðй¿ค')
FROM numbers(987654, 5);

SELECT translate('abc', '', '');

SELECT translateUTF8('abc', '', '');

SELECT translate('abc', 'Ááéíóúôè', 'aaeiouoe');

SELECT translateUTF8('abc', 'efg', '');

SELECT translateUTF8('中文内码', '中文', '');

SELECT translate('aAbBcC', 'abc', '12');

SELECT translate('aAbBcC', 'abc', '123');

SELECT translate('aAbBcC', 'abc', '');

SELECT translate('abc', 'abc', '');

SELECT translate('aAbBcC', '中文内码', '12');

SELECT translate('aAbBcC', 'ab', 'abc');