SELECT splitByRegexp('\\d+', x)
FROM (
        SELECT arrayJoin(['a1ba5ba8b', 'a11ba5689ba891011b']) AS x
    );

SELECT splitByRegexp('', 'abcde');

SELECT splitByRegexp('<[^<>]*>', x)
FROM (
        SELECT arrayJoin(['<h1>hello<h2>world</h2></h1>', 'gbye<split>bug']) AS x
    );

SELECT splitByRegexp('ab', '');

SELECT splitByRegexp('', '');

SELECT splitByRegexp(' ', 'a b c');

SELECT splitByRegexp('-', 'a-b-c');

SELECT splitByRegexp('.', 'a.b.c');

SELECT splitByRegexp('^', 'a^b^c');

SELECT splitByRegexp('$', 'a$b$c');

SELECT splitByRegexp('+', 'a+b+c');

SELECT splitByRegexp('?', 'a?b?c');

SELECT splitByRegexp('(', 'a(b(c');

SELECT splitByRegexp(')', 'a)b)c');

SELECT splitByRegexp('[', 'a[b[c');

SELECT splitByRegexp(']', 'a]b]c');

SELECT splitByRegexp('{', 'a{b{c');

SELECT splitByRegexp('}', 'a}b}c');

SELECT splitByRegexp('|', 'a|b|c');

SELECT splitByRegexp('\\', 'a\\b\\c');

SELECT splitByRegexp(materialize(1), NULL, 3);