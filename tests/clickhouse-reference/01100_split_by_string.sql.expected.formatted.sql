SELECT splitByString('ab', 'cdeabcde');

SELECT splitByString('ab', 'abcdeabcdeab');

SELECT splitByString('ab', 'ababab');

SELECT splitByString('ababab', 'ababab');

SELECT splitByString('', 'abcde');

SELECT splitByString(', ', x)
FROM (
        SELECT arrayJoin(['hello, world', 'gbye, bug']) AS x
    );

SELECT splitByString('ab', '');

SELECT splitByString('', '');