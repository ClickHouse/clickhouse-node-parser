SELECT tokens();

SELECT tokens('a', 'b', 'c', 'd');

SELECT tokens(1);

SELECT tokens('a', 1);

SELECT tokens('a', toFixedString('b', 1));

SELECT tokens('a', materialize('b'));

SELECT tokens('a', 'unsupported_tokenizer');

SELECT tokens('a', 'ngrams', 'c');

SELECT tokens('a', 'ngrams', toInt8(-1));

SELECT tokens('a', 'ngrams', toFixedString('c', 1));

SELECT tokens('a', 'ngrams', materialize(1));

SELECT tokens('a', 'ngrams', 0);

SELECT tokens('a', 'ngrams', -1);

SELECT tokens('a', 'ngrams', 18446744073709551616);

SELECT tokens('a', 'splitByString', 'c');

SELECT tokens('a', 'splitByString', toInt8(-1));

SELECT tokens('a', 'splitByString', toFixedString('c', 1));

SELECT tokens('a', 'splitByString', materialize(['c']));

SELECT tokens('a', 'splitByString', [1, 2]);

SELECT tokens('  a  bc d', 'splitByString', []);

SELECT
    tokens('') AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized);

SELECT
    tokens('abc+ def- foo! bar? baz= code; hello: world/ xäöüx') AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized);

SELECT
    tokens('', 'ngrams') AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized);

SELECT
    tokens('abc def', 'ngrams') AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized);

SELECT
    tokens('abc def', 'ngrams', 3) AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized);

SELECT
    tokens('abc def', 'ngrams', 8) AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized);

SELECT
    tokens('', 'splitByString') AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized);

SELECT
    tokens('  a  bc d', 'splitByString', [' ']) AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized);

SELECT
    tokens('()()a()bc()d', 'splitByString', ['()']) AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized);

SELECT
    tokens(',()a(),bc,(),d,', 'splitByString', ['()', ',']) AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized);

SELECT
    tokens('\\a\n\\bc\\d\n', 'splitByString', ['\n', '\\']) AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized);

SELECT
    tokens('', 'array') AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized);

SELECT
    tokens('abc def', 'array') AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized);

SELECT '-- FixedString inputs';

SELECT
    tokens(toFixedString('abc+ def- foo! bar? baz= code; hello: world/', 44)) AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized);

SELECT
    tokens(materialize('abc+ def- foo! bar? baz= code; hello: world/')) AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized);

SELECT
    tokens(str, 'splitByNonAlpha') AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized)
FROM tab;

SELECT
    tokens(str, 'ngrams', 3) AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized)
FROM tab;

SELECT
    tokens(str, 'splitByString', ['()', ',']) AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized)
FROM tab;

SELECT
    tokens(str, 'array') AS tokenized,
    toTypeName(tokenized),
    isConstant(tokenized)
FROM tab;

SELECT tokens('', 'sparseGrams') AS tokenized;

SELECT tokens('abc def cba', 'sparseGrams') AS tokenized;

SELECT tokens('abc def cba', 'sparseGrams', 4, 10) AS tokenized;

SELECT tokens('abc def cba', 'sparseGrams', 4, 10, 6) AS tokenized;