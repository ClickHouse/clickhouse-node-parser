SELECT count()
FROM test
PREWHERE hasToken(h['user-agent'], 'bulk')
WHERE hasToken(h['user-agent'], 'tests')
    AND t = 'xxx';

SELECT count()
FROM test
PREWHERE hasToken(h['user-agent'], 'tests')
WHERE hasToken(h['user-agent'], 'bulk')
    AND t = 'xxx';

SELECT count()
FROM test
WHERE hasToken(h['user-agent'], 'bulk')
    AND hasToken(h['user-agent'], 'tests')
    AND t = 'xxx';

SELECT count()
FROM test
PREWHERE hasToken(h['user-agent'], 'bulk')
    AND hasToken(h['user-agent'], 'tests')
    AND t = 'xxx';

SELECT count()
FROM test
PREWHERE hasToken(h['user-agent'], 'bulk')
    AND hasToken(h['user-agent'], 'tests')
WHERE t = 'xxx';

SELECT count()
FROM test
PREWHERE hasToken(h['user-agent'], 'tests')
    AND hasToken(h['user-agent'], 'bulk')
WHERE t = 'xxx';

SELECT count()
FROM test
PREWHERE hasToken(h['user-agent'], 'tests')
    AND hasToken(h['user-agent'], 'bulk');

SELECT count()
FROM test
PREWHERE hasToken(h['user-agent'], 'bulk')
    AND hasToken(h['user-agent'], 'tests');

SELECT count()
FROM test
WHERE hasToken(h['user-agent'], 'tests')
    AND hasToken(h['user-agent'], 'bulk');

SELECT count()
FROM test
WHERE hasToken(h['user-agent'], 'bulk')
    AND hasToken(h['user-agent'], 'tests');