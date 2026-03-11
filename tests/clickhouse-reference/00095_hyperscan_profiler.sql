SELECT count() FROM test.hits WHERE multiFuzzyMatchAny(URL, 2, ['about/address', 'for_woman', '^https?://lm-company.ruy/$', 'ultimateguitar.com']);
