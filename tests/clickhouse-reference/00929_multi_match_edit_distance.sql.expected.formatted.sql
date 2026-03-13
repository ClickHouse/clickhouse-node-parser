-- run queries multiple times to test the pattern caching
SELECT multiFuzzyMatchAny('abc', 0, ['a1c'])
FROM `system`.numbers
LIMIT 3;

SELECT multiFuzzyMatchAny('abc', 1, ['a1c'])
FROM `system`.numbers
LIMIT 3;

SELECT multiFuzzyMatchAny('abc', 2, ['a1c'])
FROM `system`.numbers
LIMIT 3;

SELECT multiFuzzyMatchAny('abc', 3, ['a1c'])
FROM `system`.numbers
LIMIT 3; -- { serverError BAD_ARGUMENTS }

SELECT multiFuzzyMatchAny('abc', 4, ['a1c'])
FROM `system`.numbers
LIMIT 3; -- { serverError BAD_ARGUMENTS }

SELECT multiFuzzyMatchAny('leftabcright', 1, ['a1c'])
FROM `system`.numbers
LIMIT 3;

SELECT multiFuzzyMatchAny('hello some world', 0, ['^hello.*world$']);

SELECT multiFuzzyMatchAny('hallo some world', 1, ['^hello.*world$']);

SELECT multiFuzzyMatchAny('halo some wrld', 2, ['^hello.*world$']);

SELECT multiFuzzyMatchAny('halo some wrld', 2, ['^hello.*world$', '^halo.*world$']);

SELECT multiFuzzyMatchAny('halo some wrld', 2, ['^halo.*world$', '^hello.*world$']);

SELECT multiFuzzyMatchAny('halo some wrld', 3, ['^hello.*world$']);

SELECT multiFuzzyMatchAny('hello some world', 10, ['^hello.*world$']); -- { serverError BAD_ARGUMENTS }

SELECT multiFuzzyMatchAny('hello some world', -1, ['^hello.*world$']); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT multiFuzzyMatchAny('hello some world', 10000000000, ['^hello.*world$']); -- { serverError ILLEGAL_COLUMN }

SELECT multiFuzzyMatchAny('http://hyperscan_is_nice.de/st', 2, ['http://hyperscan_is_nice.de/(st\\d\\d$|st\\d\\d\\.|st1[0-4]\\d|st150|st\\d$|gl|rz|ch)']);

SELECT multiFuzzyMatchAny('string', 0, ['zorro$', '^tring', 'in$', 'how.*', 'it{2}', 'works']);

SELECT multiFuzzyMatchAny('string', 1, ['zorro$', '^tring', 'ip$', 'how.*', 'it{2}', 'works']);

SELECT multiFuzzyMatchAnyIndex('string', 1, ['zorro$', '^tring', 'ip$', 'how.*', 'it{2}', 'works']);

SELECT multiFuzzyMatchAnyIndex('halo some wrld', 2, ['^hello.*world$', '^halo.*world$']);

SELECT multiFuzzyMatchAnyIndex('halo some wrld', 2, ['^halo.*world$', '^hello.*world$']);

--
SELECT arraySort(multiFuzzyMatchAllIndices('halo some wrld', 2, ['some random string', '^halo.*world$', '^halo.*world$', '^halo.*world$', '^hallllo.*world$']));

SELECT multiFuzzyMatchAllIndices('halo some wrld', 2, ['^halllllo.*world$', 'some random string']);

SELECT multiFuzzyMatchAny(materialize('abc'), 0, materialize(['a1c']))
FROM `system`.numbers
LIMIT 3;

SELECT multiFuzzyMatchAny(materialize('abc'), 1, materialize(['a1c']))
FROM `system`.numbers
LIMIT 3;

SELECT multiFuzzyMatchAny(materialize('abc'), 2, materialize(['a1c']))
FROM `system`.numbers
LIMIT 3;

SELECT multiFuzzyMatchAny(materialize('abc'), 3, materialize(['a1c']))
FROM `system`.numbers
LIMIT 3; -- { serverError BAD_ARGUMENTS}

SELECT multiFuzzyMatchAny(materialize('abc'), 4, materialize(['a1c']))
FROM `system`.numbers
LIMIT 3; -- { serverError BAD_ARGUMENTS}

SELECT multiFuzzyMatchAny(materialize('leftabcright'), 1, materialize(['a1c']));

SELECT multiFuzzyMatchAny(materialize('hello some world'), 0, materialize(['^hello.*world$']));

SELECT multiFuzzyMatchAny(materialize('hallo some world'), 1, materialize(['^hello.*world$']));

SELECT multiFuzzyMatchAny(materialize('halo some wrld'), 2, materialize(['^hello.*world$']));

SELECT multiFuzzyMatchAny(materialize('halo some wrld'), 2, materialize(['^hello.*world$', '^halo.*world$']));

SELECT multiFuzzyMatchAny(materialize('halo some wrld'), 2, materialize(['^halo.*world$', '^hello.*world$']));

SELECT multiFuzzyMatchAny(materialize('halo some wrld'), 3, materialize(['^hello.*world$']));

SELECT multiFuzzyMatchAny(materialize('hello some world'), 10, materialize(['^hello.*world$'])); -- { serverError BAD_ARGUMENTS }

SELECT multiFuzzyMatchAny(materialize('hello some world'), -1, materialize(['^hello.*world$'])); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT multiFuzzyMatchAny(materialize('hello some world'), 10000000000, materialize(['^hello.*world$'])); -- { serverError ILLEGAL_COLUMN }

SELECT multiFuzzyMatchAny(materialize('http://hyperscan_is_nice.de/st'), 2, materialize(['http://hyperscan_is_nice.de/(st\\d\\d$|st\\d\\d\\.|st1[0-4]\\d|st150|st\\d$|gl|rz|ch)']));

SELECT multiFuzzyMatchAny(materialize('string'), 0, materialize(['zorro$', '^tring', 'in$', 'how.*', 'it{2}', 'works']));

SELECT multiFuzzyMatchAny(materialize('string'), 1, materialize(['zorro$', '^tring', 'ip$', 'how.*', 'it{2}', 'works']));

SELECT multiFuzzyMatchAnyIndex(materialize('string'), 1, materialize(['zorro$', '^tring', 'ip$', 'how.*', 'it{2}', 'works']));

SELECT multiFuzzyMatchAnyIndex(materialize('halo some wrld'), 2, materialize(['^hello.*world$', '^halo.*world$']));

SELECT multiFuzzyMatchAnyIndex(materialize('halo some wrld'), 2, materialize(['^halo.*world$', '^hello.*world$']));

SELECT arraySort(multiFuzzyMatchAllIndices(materialize('halo some wrld'), 2, materialize(['some random string', '^halo.*world$', '^halo.*world$', '^halo.*world$', '^hallllo.*world$'])));

SELECT multiFuzzyMatchAllIndices(materialize('halo some wrld'), 2, materialize(['^halllllo.*world$', 'some random string']));