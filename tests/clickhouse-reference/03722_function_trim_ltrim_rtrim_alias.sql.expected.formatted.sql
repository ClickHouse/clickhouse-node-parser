-- { echoOn }
SELECT
    ltrim('   leading   '),
    trimLeft('   leading   ');

SELECT
    ltrim('xxleadingxx', 'x'),
    trimLeft('xxleadingxx', 'x');

SELECT
    rtrim('   trailing   '),
    trimRight('   trailing   ');

SELECT
    rtrim('xxtrailingxx', 'x'),
    trimRight('xxtrailingxx', 'x');

SELECT
    trim('   both   '),
    trimBoth('   both   ');

SELECT
    trim('$$both$$', '$'),
    trimBoth('$$both$$', '$');

SELECT
    trimBoth('$$both$$', '$'),
    trimBoth('$$both$$', '$');

SELECT
    trimLeft('$$both$$', '$'),
    trimLeft('$$both$$', '$');

SELECT
    trimRight('$$both$$', '$'),
    trimRight('$$both$$', '$');

SELECT
    'xx',
    trimBoth('xx', '');

SELECT
    'xx',
    trimLeft('xx', '');

SELECT
    'xx',
    trimRight('xx', '');

SELECT
    trimBoth('$$both$$', concat('$', '$')),
    trimBoth('$$both$$', '$$');

SELECT
    ltrim('\t  abc', '\t '),
    trimLeft('\t  abc', '\t ');

SELECT
    rtrim('abc\t  ', '\t '),
    trimRight('abc\t  ', '\t ');

SELECT
    TrIm('  x  '),
    trimBoth('  x  ');

SELECT
    LTRIM('  x  '),
    trimLeft('  x  ');

SELECT
    RTRIM('  x  '),
    trimRight('  x  ');