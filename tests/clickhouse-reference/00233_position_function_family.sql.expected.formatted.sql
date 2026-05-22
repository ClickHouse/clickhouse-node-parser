-- Tags: no-fasttest
-- no-fasttest: upper/lowerUTF8 use ICU
SET send_logs_level = 'fatal';

SELECT 1 = position('', '');

SELECT 1 = position('abc', '');

SELECT 0 = position('', 'abc');

SELECT 1 = position('abc', 'abc');

SELECT 2 = position('abc', 'bc');

SELECT 3 = position('abc', 'c');

SELECT 1 = position('', '', 0);

SELECT 1 = position('', '', 1);

SELECT 0 = position('', '', 2);

SELECT 1 = position('a', '', 1);

SELECT 2 = position('a', '', 2);

SELECT 0 = position('a', '', 3);

SELECT [1, 1, 2, 3, 4, 5, 0, 0, 0, 0] = groupArray(position('aaaa', '', number))
FROM numbers(10);

SELECT [1, 1, 2, 3, 4, 5, 0, 0, 0, 0] = groupArray(position(materialize('aaaa'), '', number))
FROM numbers(10);

SELECT [1, 1, 2, 3, 4, 5, 0, 0, 0, 0] = groupArray(position('aaaa', materialize(''), number))
FROM numbers(10);

SELECT [1, 1, 2, 3, 4, 5, 0, 0, 0, 0] = groupArray(position(materialize('aaaa'), materialize(''), number))
FROM numbers(10);

SELECT [1, 1, 2, 3, 4, 0, 0, 0, 0, 0] = groupArray(position('aaaa', 'a', number))
FROM numbers(10);

SELECT [1, 1, 2, 3, 4, 0, 0, 0, 0, 0] = groupArray(position(materialize('aaaa'), 'a', number))
FROM numbers(10);

SELECT [1, 1, 2, 3, 4, 0, 0, 0, 0, 0] = groupArray(position('aaaa', materialize('a'), number))
FROM numbers(10);

SELECT [1, 1, 2, 3, 4, 0, 0, 0, 0, 0] = groupArray(position(materialize('aaaa'), materialize('a'), number))
FROM numbers(10);

SELECT 1 = position(materialize(''), '');

SELECT 1 = position(materialize('abc'), '');

SELECT 0 = position(materialize(''), 'abc');

SELECT 1 = position(materialize('abc'), 'abc');

SELECT 2 = position(materialize('abc'), 'bc');

SELECT 3 = position(materialize('abc'), 'c');

SELECT 1 = position(materialize(''), '')
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position(materialize('abc'), '')
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position(materialize(''), 'abc')
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position(materialize('abc'), 'abc')
FROM `system`.numbers
LIMIT 10;

SELECT 2 = position(materialize('abc'), 'bc')
FROM `system`.numbers
LIMIT 10;

SELECT 3 = position(materialize('abc'), 'c')
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position('абв', '');

SELECT 0 = position('', 'абв');

SELECT 1 = position('абв', 'абв');

SELECT 3 = position('абв', 'бв');

SELECT 5 = position('абв', 'в');

SELECT 2 = position('abcabc', 'b', 0);

SELECT 2 = position('abcabc', 'b', 1);

SELECT 2 = position('abcabc', 'b', 2);

SELECT 5 = position('abcabc', 'b', 3);

SELECT 5 = position('abcabc', 'b', 4);

SELECT 5 = position('abcabc', 'b', 5);

SELECT 0 = position('abcabc', 'b', 6);

SELECT 2 = position('abcabc', 'bca', 0);

SELECT 0 = position('abcabc', 'bca', 3);

SELECT 1 = position(materialize('абв'), '');

SELECT 0 = position(materialize(''), 'абв');

SELECT 1 = position(materialize('абв'), 'абв');

SELECT 3 = position(materialize('абв'), 'бв');

SELECT 5 = position(materialize('абв'), 'в');

SELECT 1 = position(materialize('абв'), '')
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position(materialize(''), 'абв')
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position(materialize('абв'), 'абв')
FROM `system`.numbers
LIMIT 10;

SELECT 3 = position(materialize('абв'), 'бв')
FROM `system`.numbers
LIMIT 10;

SELECT 5 = position(materialize('абв'), 'в')
FROM `system`.numbers
LIMIT 10;

SELECT 1 = positionUTF8('', '');

SELECT 1 = positionUTF8('абв', '');

SELECT 0 = positionUTF8('', 'абв');

SELECT 1 = positionUTF8('абв', 'абв');

SELECT 2 = positionUTF8('абв', 'бв');

SELECT 3 = positionUTF8('абв', 'в');

SELECT 3 = position('абвабв', 'б', 2);

SELECT 3 = position('абвабв', 'б', 3);

SELECT 3 = position('абвабв', 'бва', 2);

SELECT 9 = position('абвабв', 'б', 4);

SELECT 0 = position('абвабв', 'бва', 4);

SELECT 5 = position('абвабв', 'в', 0);

SELECT 11 = position('абвабв', 'в', 6);

SELECT 1 = positionUTF8(materialize(''), '');

SELECT 1 = positionUTF8(materialize('абв'), '');

SELECT 0 = positionUTF8(materialize(''), 'абв');

SELECT 1 = positionUTF8(materialize('абв'), 'абв');

SELECT 2 = positionUTF8(materialize('абв'), 'бв');

SELECT 3 = positionUTF8(materialize('абв'), 'в');

SELECT 1 = positionUTF8(materialize(''), '')
FROM `system`.numbers
LIMIT 10;

SELECT 1 = positionUTF8(materialize('абв'), '')
FROM `system`.numbers
LIMIT 10;

SELECT 0 = positionUTF8(materialize(''), 'абв')
FROM `system`.numbers
LIMIT 10;

SELECT 1 = positionUTF8(materialize('абв'), 'абв')
FROM `system`.numbers
LIMIT 10;

SELECT 2 = positionUTF8(materialize('абв'), 'бв')
FROM `system`.numbers
LIMIT 10;

SELECT 3 = positionUTF8(materialize('абв'), 'в')
FROM `system`.numbers
LIMIT 10;

SELECT 2 = positionUTF8('абвабв', 'б', 0);

SELECT 2 = positionUTF8('абвабв', 'б', 1);

SELECT 2 = positionUTF8('абвабв', 'б', 2);

SELECT 5 = positionUTF8('абвабв', 'б', 3);

SELECT 5 = positionUTF8('абвабв', 'б', 4);

SELECT 5 = positionUTF8('абвабв', 'б', 5);

SELECT 0 = positionUTF8('абвабв', 'б', 6);

SELECT 2 = positionUTF8('абвабв', 'бва', 0);

SELECT 0 = positionUTF8('абвабв', 'бва', 3);

SELECT 2 = positionUTF8(materialize('абвабв'), 'б', 0)
FROM `system`.numbers
LIMIT 10;

SELECT 2 = positionUTF8(materialize('абвабв'), 'б', 1)
FROM `system`.numbers
LIMIT 10;

SELECT 2 = positionUTF8(materialize('абвабв'), 'б', 2)
FROM `system`.numbers
LIMIT 10;

SELECT 5 = positionUTF8(materialize('абвабв'), 'б', 3)
FROM `system`.numbers
LIMIT 10;

SELECT 5 = positionUTF8(materialize('абвабв'), 'б', 4)
FROM `system`.numbers
LIMIT 10;

SELECT 5 = positionUTF8(materialize('абвабв'), 'б', 5)
FROM `system`.numbers
LIMIT 10;

SELECT 0 = positionUTF8(materialize('абвабв'), 'б', 6)
FROM `system`.numbers
LIMIT 10;

SELECT 2 = positionUTF8(materialize('абвабв'), 'бва', 0)
FROM `system`.numbers
LIMIT 10;

SELECT 0 = positionUTF8(materialize('абвабв'), 'бва', 3)
FROM `system`.numbers
LIMIT 10;

SELECT 2 = positionUTF8('абвабв', materialize('б'), 0)
FROM `system`.numbers
LIMIT 10;

SELECT 2 = positionUTF8('абвабв', materialize('б'), 1)
FROM `system`.numbers
LIMIT 10;

SELECT 2 = positionUTF8('абвабв', materialize('б'), 2)
FROM `system`.numbers
LIMIT 10;

SELECT 5 = positionUTF8('абвабв', materialize('б'), 3)
FROM `system`.numbers
LIMIT 10;

SELECT 5 = positionUTF8('абвабв', materialize('б'), 4)
FROM `system`.numbers
LIMIT 10;

SELECT 5 = positionUTF8('абвабв', materialize('б'), 5)
FROM `system`.numbers
LIMIT 10;

SELECT 0 = positionUTF8('абвабв', materialize('б'), 6)
FROM `system`.numbers
LIMIT 10;

SELECT 2 = positionUTF8('абвабв', materialize('бва'), 0)
FROM `system`.numbers
LIMIT 10;

SELECT 0 = positionUTF8('абвабв', materialize('бва'), 3)
FROM `system`.numbers
LIMIT 10;

SELECT 2 = positionUTF8(materialize('абвабв'), materialize('б'), 0)
FROM `system`.numbers
LIMIT 10;

SELECT 2 = positionUTF8(materialize('абвабв'), materialize('б'), 1)
FROM `system`.numbers
LIMIT 10;

SELECT 2 = positionUTF8(materialize('абвабв'), materialize('б'), 2)
FROM `system`.numbers
LIMIT 10;

SELECT 5 = positionUTF8(materialize('абвабв'), materialize('б'), 3)
FROM `system`.numbers
LIMIT 10;

SELECT 5 = positionUTF8(materialize('абвабв'), materialize('б'), 4)
FROM `system`.numbers
LIMIT 10;

SELECT 5 = positionUTF8(materialize('абвабв'), materialize('б'), 5)
FROM `system`.numbers
LIMIT 10;

SELECT 0 = positionUTF8(materialize('абвабв'), materialize('б'), 6)
FROM `system`.numbers
LIMIT 10;

SELECT 2 = positionUTF8(materialize('абвабв'), materialize('бва'), 0)
FROM `system`.numbers
LIMIT 10;

SELECT 0 = positionUTF8(materialize('абвабв'), materialize('бва'), 3)
FROM `system`.numbers
LIMIT 10;

SELECT [2, 2, 2, 5, 5, 5, 0, 0, 0, 0] = groupArray(positionUTF8(materialize('абвабв'), materialize('б'), number))
FROM numbers(10);

SELECT [2, 2, 2, 5, 5, 5, 0, 0, 0, 0] = groupArray(positionUTF8('абвабв', materialize('б'), number))
FROM numbers(10);

SELECT [2, 2, 2, 5, 5, 5, 0, 0, 0, 0] = groupArray(positionUTF8('абвабв', 'б', number))
FROM numbers(10);

SELECT [2, 2, 2, 5, 5, 5, 0, 0, 0, 0] = groupArray(positionUTF8(materialize('абвабв'), 'б', number))
FROM numbers(10);

SELECT 1 = positionCaseInsensitive('', '');

SELECT 1 = positionCaseInsensitive('abc', '');

SELECT 0 = positionCaseInsensitive('', 'aBc');

SELECT 1 = positionCaseInsensitive('abc', 'aBc');

SELECT 2 = positionCaseInsensitive('abc', 'Bc');

SELECT 3 = positionCaseInsensitive('abc', 'C');

SELECT 1 = positionCaseInsensitive(materialize(''), '');

SELECT 1 = positionCaseInsensitive(materialize('abc'), '');

SELECT 0 = positionCaseInsensitive(materialize(''), 'aBc');

SELECT 1 = positionCaseInsensitive(materialize('abc'), 'aBc');

SELECT 2 = positionCaseInsensitive(materialize('abc'), 'Bc');

SELECT 3 = positionCaseInsensitive(materialize('abc'), 'C');

SELECT 1 = positionCaseInsensitive(materialize(''), '')
FROM `system`.numbers
LIMIT 10;

SELECT 1 = positionCaseInsensitive(materialize('abc'), '')
FROM `system`.numbers
LIMIT 10;

SELECT 0 = positionCaseInsensitive(materialize(''), 'aBc')
FROM `system`.numbers
LIMIT 10;

SELECT 1 = positionCaseInsensitive(materialize('abc'), 'aBc')
FROM `system`.numbers
LIMIT 10;

SELECT 2 = positionCaseInsensitive(materialize('abc'), 'Bc')
FROM `system`.numbers
LIMIT 10;

SELECT 3 = positionCaseInsensitive(materialize('abc'), 'C')
FROM `system`.numbers
LIMIT 10;

SELECT 6 = positionCaseInsensitive(materialize('abcabc'), 'C', 4);

SELECT 6 = positionCaseInsensitive(materialize('abcabc'), 'C', 4)
FROM `system`.numbers
LIMIT 10;

SELECT 6 = positionCaseInsensitive(materialize('abcabc'), 'C', materialize(4))
FROM `system`.numbers
LIMIT 10;

SELECT 1 = positionCaseInsensitive('абв', '');

SELECT 0 = positionCaseInsensitive('', 'аБв');

SELECT 0 = positionCaseInsensitive('абв', 'аБв');

SELECT 0 = positionCaseInsensitive('абв', 'Бв');

SELECT 0 = positionCaseInsensitive('абв', 'В');

SELECT 1 = positionCaseInsensitive(materialize('абв'), '');

SELECT 0 = positionCaseInsensitive(materialize(''), 'аБв');

SELECT 0 = positionCaseInsensitive(materialize('абв'), 'аБв');

SELECT 0 = positionCaseInsensitive(materialize('абв'), 'Бв');

SELECT 0 = positionCaseInsensitive(materialize('абв'), 'В');

SELECT 1 = positionCaseInsensitive(materialize('абв'), '')
FROM `system`.numbers
LIMIT 10;

SELECT 0 = positionCaseInsensitive(materialize(''), 'аБв')
FROM `system`.numbers
LIMIT 10;

SELECT 0 = positionCaseInsensitive(materialize('абв'), 'аБв')
FROM `system`.numbers
LIMIT 10;

SELECT 0 = positionCaseInsensitive(materialize('абв'), 'Бв')
FROM `system`.numbers
LIMIT 10;

SELECT 0 = positionCaseInsensitive(materialize('абв'), 'В')
FROM `system`.numbers
LIMIT 10;

SELECT 1 = positionCaseInsensitiveUTF8('', '');

SELECT 1 = positionCaseInsensitiveUTF8('абв', '');

SELECT 0 = positionCaseInsensitiveUTF8('', 'аБв');

SELECT 1 = positionCaseInsensitiveUTF8('абв', 'аБв');

SELECT 2 = positionCaseInsensitiveUTF8('абв', 'Бв');

SELECT 3 = positionCaseInsensitiveUTF8('абв', 'в');

SELECT 1 = positionCaseInsensitiveUTF8(materialize(''), '');

SELECT 1 = positionCaseInsensitiveUTF8(materialize('абв'), '');

SELECT 0 = positionCaseInsensitiveUTF8(materialize(''), 'аБв');

SELECT 1 = positionCaseInsensitiveUTF8(materialize('абв'), 'аБв');

SELECT 2 = positionCaseInsensitiveUTF8(materialize('абв'), 'Бв');

SELECT 3 = positionCaseInsensitiveUTF8(materialize('абв'), 'В');

SELECT 1 = positionCaseInsensitiveUTF8(materialize(''), '')
FROM `system`.numbers
LIMIT 10;

SELECT 1 = positionCaseInsensitiveUTF8(materialize('абв'), '')
FROM `system`.numbers
LIMIT 10;

SELECT 0 = positionCaseInsensitiveUTF8(materialize(''), 'аБв')
FROM `system`.numbers
LIMIT 10;

SELECT 1 = positionCaseInsensitiveUTF8(materialize('абв'), 'аБв')
FROM `system`.numbers
LIMIT 10;

SELECT 2 = positionCaseInsensitiveUTF8(materialize('абв'), 'Бв')
FROM `system`.numbers
LIMIT 10;

SELECT 3 = positionCaseInsensitiveUTF8(materialize('абв'), 'В')
FROM `system`.numbers
LIMIT 10;

SELECT 6 = positionCaseInsensitiveUTF8(materialize('абвабв'), 'В', 4);

SELECT 6 = positionCaseInsensitiveUTF8(materialize('абвабв'), 'В', 4)
FROM `system`.numbers
LIMIT 10;

SELECT 6 = positionCaseInsensitiveUTF8(materialize('абвабв'), 'В', materialize(4))
FROM `system`.numbers
LIMIT 10;

SELECT position('' AS h, '' AS n) = positionCaseInsensitive(h, n);

SELECT position('abc' AS h, '' AS n) = positionCaseInsensitive(n, n);

SELECT position('abc' AS h, lower('aBc' AS n)) = positionCaseInsensitive(h, n);

SELECT position('abc' AS h, lower('Bc' AS n)) = positionCaseInsensitive(h, n);

SELECT position('abc' AS h, lower('C' AS n)) = positionCaseInsensitive(h, n);

SELECT positionCaseInsensitive(materialize('') AS h, '' AS n) = positionCaseInsensitive(h, n);

SELECT positionCaseInsensitive(materialize('abc') AS h, '' AS n) = positionCaseInsensitive(h, n);

SELECT positionCaseInsensitive(materialize('') AS h, lower('aBc' AS n)) = positionCaseInsensitive(h, n);

SELECT positionCaseInsensitive(materialize('abc') AS h, lower('aBc' AS n)) = positionCaseInsensitive(h, n);

SELECT positionCaseInsensitive(materialize('abc') AS h, lower('Bc' AS n)) = positionCaseInsensitive(h, n);

SELECT positionCaseInsensitive(materialize('abc') AS h, lower('C' AS n)) = positionCaseInsensitive(h, n);

SELECT position(materialize('') AS h, lower('' AS n)) = positionCaseInsensitive(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT position(materialize('abc') AS h, lower('' AS n)) = positionCaseInsensitive(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT position(materialize('') AS h, lower('aBc' AS n)) = positionCaseInsensitive(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT position(materialize('abc') AS h, lower('aBc' AS n)) = positionCaseInsensitive(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT position(materialize('abc') AS h, lower('Bc' AS n)) = positionCaseInsensitive(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT position(materialize('abc') AS h, lower('C' AS n)) = positionCaseInsensitive(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT position('' AS h, lower('' AS n)) = positionCaseInsensitive(h, n);

SELECT position('абв' AS h, lower('' AS n)) = positionCaseInsensitive(h, n);

SELECT position('' AS h, lower('аБв' AS n)) = positionCaseInsensitive(h, n);

SELECT position('абв' AS h, lower('аБв' AS n)) = positionCaseInsensitive(h, n);

SELECT position('абв' AS h, lower('Бв' AS n)) = positionCaseInsensitive(h, n);

SELECT position('абв' AS h, lower('В' AS n)) = positionCaseInsensitive(h, n);

SELECT position(materialize('') AS h, lower('' AS n)) = positionCaseInsensitive(h, n);

SELECT position(materialize('абв') AS h, lower('' AS n)) = positionCaseInsensitive(h, n);

SELECT position(materialize('') AS h, lower('аБв' AS n)) = positionCaseInsensitive(h, n);

SELECT position(materialize('абв') AS h, lower('аБв' AS n)) = positionCaseInsensitive(h, n);

SELECT position(materialize('абв') AS h, lower('Бв' AS n)) = positionCaseInsensitive(h, n);

SELECT position(materialize('абв') AS h, lower('В' AS n)) = positionCaseInsensitive(h, n);

SELECT position(materialize('абв') AS h, lower('' AS n)) = positionCaseInsensitive(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT position(materialize('') AS h, lower('аБв' AS n)) = positionCaseInsensitive(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT position(materialize('абв') AS h, lower('аБв' AS n)) = positionCaseInsensitive(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT position(materialize('абв') AS h, lower('Бв' AS n)) = positionCaseInsensitive(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT position(materialize('абв') AS h, lower('В' AS n)) = positionCaseInsensitive(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT positionUTF8('' AS h, lowerUTF8('' AS n)) = positionCaseInsensitiveUTF8(h, n);

SELECT positionUTF8('абв' AS h, lowerUTF8('' AS n)) = positionCaseInsensitiveUTF8(h, n);

SELECT positionUTF8('' AS h, lowerUTF8('аБв' AS n)) = positionCaseInsensitiveUTF8(h, n);

SELECT positionUTF8('абв' AS h, lowerUTF8('аБв' AS n)) = positionCaseInsensitiveUTF8(h, n);

SELECT positionUTF8('абв' AS h, lowerUTF8('Бв' AS n)) = positionCaseInsensitiveUTF8(h, n);

SELECT positionUTF8('абв' AS h, lowerUTF8('в' AS n)) = positionCaseInsensitiveUTF8(h, n);

SELECT positionUTF8(materialize('') AS h, lowerUTF8('' AS n)) = positionCaseInsensitiveUTF8(h, n);

SELECT positionUTF8(materialize('абв') AS h, lowerUTF8('' AS n)) = positionCaseInsensitiveUTF8(h, n);

SELECT positionUTF8(materialize('') AS h, lowerUTF8('аБв' AS n)) = positionCaseInsensitiveUTF8(h, n);

SELECT positionUTF8(materialize('абв') AS h, lowerUTF8('аБв' AS n)) = positionCaseInsensitiveUTF8(h, n);

SELECT positionUTF8(materialize('абв') AS h, lowerUTF8('Бв' AS n)) = positionCaseInsensitiveUTF8(h, n);

SELECT positionUTF8(materialize('абв') AS h, lowerUTF8('В' AS n)) = positionCaseInsensitiveUTF8(h, n);

SELECT positionUTF8(materialize('') AS h, lowerUTF8('' AS n)) = positionCaseInsensitiveUTF8(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT positionUTF8(materialize('абв') AS h, lowerUTF8('' AS n)) = positionCaseInsensitiveUTF8(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT positionUTF8(materialize('') AS h, lowerUTF8('аБв' AS n)) = positionCaseInsensitiveUTF8(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT positionUTF8(materialize('абв') AS h, lowerUTF8('аБв' AS n)) = positionCaseInsensitiveUTF8(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT positionUTF8(materialize('абв') AS h, lowerUTF8('Бв' AS n)) = positionCaseInsensitiveUTF8(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT positionUTF8(materialize('абв') AS h, lowerUTF8('В' AS n)) = positionCaseInsensitiveUTF8(h, n)
FROM `system`.numbers
LIMIT 10;

SELECT 2 = position('abcdefgh', materialize('b'));

SELECT 2 = position('abcdefgh', materialize('bc'));

SELECT 2 = position('abcdefgh', materialize('bcd'));

SELECT 2 = position('abcdefgh', materialize('bcde'));

SELECT 2 = position('abcdefgh', materialize('bcdef'));

SELECT 2 = position('abcdefgh', materialize('bcdefg'));

SELECT 2 = position('abcdefgh', materialize('bcdefgh'));

SELECT 1 = position('abcdefgh', materialize('abcdefgh'));

SELECT 1 = position('abcdefgh', materialize('abcdefg'));

SELECT 1 = position('abcdefgh', materialize('abcdef'));

SELECT 1 = position('abcdefgh', materialize('abcde'));

SELECT 1 = position('abcdefgh', materialize('abcd'));

SELECT 1 = position('abcdefgh', materialize('abc'));

SELECT 1 = position('abcdefgh', materialize('ab'));

SELECT 1 = position('abcdefgh', materialize('a'));

SELECT 3 = position('abcdefgh', materialize('c'));

SELECT 3 = position('abcdefgh', materialize('cd'));

SELECT 3 = position('abcdefgh', materialize('cde'));

SELECT 3 = position('abcdefgh', materialize('cdef'));

SELECT 3 = position('abcdefgh', materialize('cdefg'));

SELECT 3 = position('abcdefgh', materialize('cdefgh'));

SELECT 4 = position('abcdefgh', materialize('defgh'));

SELECT 4 = position('abcdefgh', materialize('defg'));

SELECT 4 = position('abcdefgh', materialize('def'));

SELECT 4 = position('abcdefgh', materialize('de'));

SELECT 4 = position('abcdefgh', materialize('d'));

SELECT 5 = position('abcdefgh', materialize('e'));

SELECT 5 = position('abcdefgh', materialize('ef'));

SELECT 5 = position('abcdefgh', materialize('efg'));

SELECT 5 = position('abcdefgh', materialize('efgh'));

SELECT 6 = position('abcdefgh', materialize('fgh'));

SELECT 6 = position('abcdefgh', materialize('fg'));

SELECT 6 = position('abcdefgh', materialize('f'));

SELECT 7 = position('abcdefgh', materialize('g'));

SELECT 7 = position('abcdefgh', materialize('gh'));

SELECT 8 = position('abcdefgh', materialize('h'));

SELECT 2 = position('abcdefgh', materialize('b'))
FROM `system`.numbers
LIMIT 10;

SELECT 2 = position('abcdefgh', materialize('bc'))
FROM `system`.numbers
LIMIT 10;

SELECT 2 = position('abcdefgh', materialize('bcd'))
FROM `system`.numbers
LIMIT 10;

SELECT 2 = position('abcdefgh', materialize('bcde'))
FROM `system`.numbers
LIMIT 10;

SELECT 2 = position('abcdefgh', materialize('bcdef'))
FROM `system`.numbers
LIMIT 10;

SELECT 2 = position('abcdefgh', materialize('bcdefg'))
FROM `system`.numbers
LIMIT 10;

SELECT 2 = position('abcdefgh', materialize('bcdefgh'))
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position('abcdefgh', materialize('abcdefgh'))
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position('abcdefgh', materialize('abcdefg'))
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position('abcdefgh', materialize('abcdef'))
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position('abcdefgh', materialize('abcde'))
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position('abcdefgh', materialize('abcd'))
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position('abcdefgh', materialize('abc'))
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position('abcdefgh', materialize('ab'))
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position('abcdefgh', materialize('a'))
FROM `system`.numbers
LIMIT 10;

SELECT 3 = position('abcdefgh', materialize('c'))
FROM `system`.numbers
LIMIT 10;

SELECT 3 = position('abcdefgh', materialize('cd'))
FROM `system`.numbers
LIMIT 10;

SELECT 3 = position('abcdefgh', materialize('cde'))
FROM `system`.numbers
LIMIT 10;

SELECT 3 = position('abcdefgh', materialize('cdef'))
FROM `system`.numbers
LIMIT 10;

SELECT 3 = position('abcdefgh', materialize('cdefg'))
FROM `system`.numbers
LIMIT 10;

SELECT 3 = position('abcdefgh', materialize('cdefgh'))
FROM `system`.numbers
LIMIT 10;

SELECT 4 = position('abcdefgh', materialize('defgh'))
FROM `system`.numbers
LIMIT 10;

SELECT 4 = position('abcdefgh', materialize('defg'))
FROM `system`.numbers
LIMIT 10;

SELECT 4 = position('abcdefgh', materialize('def'))
FROM `system`.numbers
LIMIT 10;

SELECT 4 = position('abcdefgh', materialize('de'))
FROM `system`.numbers
LIMIT 10;

SELECT 4 = position('abcdefgh', materialize('d'))
FROM `system`.numbers
LIMIT 10;

SELECT 5 = position('abcdefgh', materialize('e'))
FROM `system`.numbers
LIMIT 10;

SELECT 5 = position('abcdefgh', materialize('ef'))
FROM `system`.numbers
LIMIT 10;

SELECT 5 = position('abcdefgh', materialize('efg'))
FROM `system`.numbers
LIMIT 10;

SELECT 5 = position('abcdefgh', materialize('efgh'))
FROM `system`.numbers
LIMIT 10;

SELECT 6 = position('abcdefgh', materialize('fgh'))
FROM `system`.numbers
LIMIT 10;

SELECT 6 = position('abcdefgh', materialize('fg'))
FROM `system`.numbers
LIMIT 10;

SELECT 6 = position('abcdefgh', materialize('f'))
FROM `system`.numbers
LIMIT 10;

SELECT 7 = position('abcdefgh', materialize('g'))
FROM `system`.numbers
LIMIT 10;

SELECT 7 = position('abcdefgh', materialize('gh'))
FROM `system`.numbers
LIMIT 10;

SELECT 8 = position('abcdefgh', materialize('h'))
FROM `system`.numbers
LIMIT 10;

SELECT 2 = position('abcdefgh', materialize('b'))
FROM `system`.numbers
LIMIT 129;

SELECT 2 = position('abcdefgh', materialize('bc'))
FROM `system`.numbers
LIMIT 129;

SELECT 2 = position('abcdefgh', materialize('bcde'))
FROM `system`.numbers
LIMIT 129;

SELECT 2 = position('abcdefgh', materialize('bcdef'))
FROM `system`.numbers
LIMIT 129;

SELECT 2 = position('abcdefgh', materialize('bcdefg'))
FROM `system`.numbers
LIMIT 129;

SELECT 2 = position('abcdefgh', materialize('bcdefgh'))
FROM `system`.numbers
LIMIT 129;

SELECT 1 = position('abcdefgh', materialize('abcdefgh'))
FROM `system`.numbers
LIMIT 129;

SELECT 1 = position('abcdefgh', materialize('abcdefg'))
FROM `system`.numbers
LIMIT 129;

SELECT 1 = position('abcdefgh', materialize('abcdef'))
FROM `system`.numbers
LIMIT 129;

SELECT 1 = position('abcdefgh', materialize('abcde'))
FROM `system`.numbers
LIMIT 129;

SELECT 1 = position('abcdefgh', materialize('abcd'))
FROM `system`.numbers
LIMIT 129;

SELECT 1 = position('abcdefgh', materialize('abc'))
FROM `system`.numbers
LIMIT 129;

SELECT 1 = position('abcdefgh', materialize('ab'))
FROM `system`.numbers
LIMIT 129;

SELECT 1 = position('abcdefgh', materialize('a'))
FROM `system`.numbers
LIMIT 129;

SELECT 3 = position('abcdefgh', materialize('c'))
FROM `system`.numbers
LIMIT 129;

SELECT 3 = position('abcdefgh', materialize('cd'))
FROM `system`.numbers
LIMIT 129;

SELECT 3 = position('abcdefgh', materialize('cde'))
FROM `system`.numbers
LIMIT 129;

SELECT 3 = position('abcdefgh', materialize('cdef'))
FROM `system`.numbers
LIMIT 129;

SELECT 3 = position('abcdefgh', materialize('cdefg'))
FROM `system`.numbers
LIMIT 129;

SELECT 3 = position('abcdefgh', materialize('cdefgh'))
FROM `system`.numbers
LIMIT 129;

SELECT 4 = position('abcdefgh', materialize('defgh'))
FROM `system`.numbers
LIMIT 129;

SELECT 4 = position('abcdefgh', materialize('defg'))
FROM `system`.numbers
LIMIT 129;

SELECT 4 = position('abcdefgh', materialize('def'))
FROM `system`.numbers
LIMIT 129;

SELECT 4 = position('abcdefgh', materialize('de'))
FROM `system`.numbers
LIMIT 129;

SELECT 4 = position('abcdefgh', materialize('d'))
FROM `system`.numbers
LIMIT 129;

SELECT 5 = position('abcdefgh', materialize('e'))
FROM `system`.numbers
LIMIT 129;

SELECT 5 = position('abcdefgh', materialize('ef'))
FROM `system`.numbers
LIMIT 129;

SELECT 5 = position('abcdefgh', materialize('efg'))
FROM `system`.numbers
LIMIT 129;

SELECT 5 = position('abcdefgh', materialize('efgh'))
FROM `system`.numbers
LIMIT 129;

SELECT 6 = position('abcdefgh', materialize('fgh'))
FROM `system`.numbers
LIMIT 129;

SELECT 6 = position('abcdefgh', materialize('fg'))
FROM `system`.numbers
LIMIT 129;

SELECT 6 = position('abcdefgh', materialize('f'))
FROM `system`.numbers
LIMIT 129;

SELECT 7 = position('abcdefgh', materialize('g'))
FROM `system`.numbers
LIMIT 129;

SELECT 7 = position('abcdefgh', materialize('gh'))
FROM `system`.numbers
LIMIT 129;

SELECT 8 = position('abcdefgh', materialize('h'))
FROM `system`.numbers
LIMIT 129;

SELECT 2 = position('abc', materialize('b'));

SELECT 2 = position('abc', materialize('bc'));

SELECT 0 = position('abc', materialize('bcde'));

SELECT 0 = position('abc', materialize('bcdef'));

SELECT 0 = position('abc', materialize('bcdefg'));

SELECT 0 = position('abc', materialize('bcdefgh'));

SELECT 0 = position('abc', materialize('abcdefg'));

SELECT 0 = position('abc', materialize('abcdef'));

SELECT 0 = position('abc', materialize('abcde'));

SELECT 0 = position('abc', materialize('abcd'));

SELECT 1 = position('abc', materialize('abc'));

SELECT 1 = position('abc', materialize('ab'));

SELECT 1 = position('abc', materialize('a'));

SELECT 3 = position('abcd', materialize('c'));

SELECT 3 = position('abcd', materialize('cd'));

SELECT 0 = position('abcd', materialize('cde'));

SELECT 0 = position('abcd', materialize('cdef'));

SELECT 0 = position('abcd', materialize('cdefg'));

SELECT 0 = position('abcd', materialize('cdefgh'));

SELECT 0 = position('abc', materialize('defgh'));

SELECT 0 = position('abc', materialize('defg'));

SELECT 0 = position('abc', materialize('def'));

SELECT 0 = position('abc', materialize('de'));

SELECT 0 = position('abc', materialize('d'));

SELECT 2 = position('abc', materialize('b'))
FROM `system`.numbers
LIMIT 10;

SELECT 2 = position('abc', materialize('bc'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abc', materialize('bcde'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abc', materialize('bcdef'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abc', materialize('bcdefg'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abc', materialize('bcdefgh'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abc', materialize('abcdefg'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abc', materialize('abcdef'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abc', materialize('abcde'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abc', materialize('abcd'))
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position('abc', materialize('abc'))
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position('abc', materialize('ab'))
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position('abc', materialize('a'))
FROM `system`.numbers
LIMIT 10;

SELECT 3 = position('abcd', materialize('c'))
FROM `system`.numbers
LIMIT 10;

SELECT 3 = position('abcd', materialize('cd'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abcd', materialize('cde'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abcd', materialize('cdef'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abcd', materialize('cdefg'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abcd', materialize('cdefgh'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abc', materialize('defgh'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abc', materialize('defg'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abc', materialize('def'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abc', materialize('de'))
FROM `system`.numbers
LIMIT 10;

SELECT 0 = position('abc', materialize('d'))
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position('abc', materialize(''));

SELECT 1 = position('abc', materialize(''))
FROM `system`.numbers
LIMIT 10;

SELECT 1 = position('abc', materialize(''))
FROM `system`.numbers
LIMIT 100;

SELECT 1 = position('abc', materialize(''))
FROM `system`.numbers
LIMIT 1000;

SELECT 1 = position('abab', materialize('ab'));

SELECT 1 = position('abababababababababababab', materialize('abab'));

SELECT 1 = position('abababababababababababab', materialize('abababababababababa'));

SELECT positionUTF8('你', '', 3) = positionUTF8(materialize('你'), materialize(''), materialize(3));