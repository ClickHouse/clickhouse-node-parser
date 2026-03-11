SELECT multiMatchAny('test', ['.{51}']);

SELECT multiMatchAny('test', ['.{   51}']);

SELECT multiMatchAny('test', ['.{51   }']);

SELECT multiMatchAny('test', ['prefix.{51}']);

SELECT multiMatchAny('test', ['.{51}.suffix']);

SELECT multiMatchAny('test', ['.{4,4}midfix{51}']);

SELECT multiMatchAny('test', ['.{51,}']);

SELECT multiMatchAny('test', ['.{   51,}']);

SELECT multiMatchAny('test', ['.{51   ,}']);

SELECT multiMatchAny('test', ['.{51,   }']);

SELECT multiMatchAny('test', ['prefix.{51,}']);

SELECT multiMatchAny('test', ['.{51,}.suffix']);

SELECT multiMatchAny('test', ['.{4,4}midfix{51,}']);

SELECT multiMatchAny('test', ['.{1,51}']);

SELECT multiMatchAny('test', ['.{51,52}']);

SELECT multiMatchAny('test', ['.{   51,52}']);

SELECT multiMatchAny('test', ['.{51   ,52}']);

SELECT multiMatchAny('test', ['.{51,   52}']);

SELECT multiMatchAny('test', ['.{51,52   }']);

SELECT multiMatchAny('test', ['prefix.{1,51}']);

SELECT multiMatchAny('test', ['.{1,51}.suffix']);

SELECT multiMatchAny('test', ['.{4,4}midfix{1,51}']);

SELECT multiMatchAny('Hallo Welt', ['.{51}']);

SELECT multiMatchAny(c, ['.{51}'])
FROM t;

SELECT multiMatchAnyIndex('Hallo Welt', ['.{51}']);

SELECT multiMatchAnyIndex(c, ['.{51}'])
FROM t;

SELECT multiMatchAllIndices('Hallo Welt', ['.{51}']);

SELECT multiMatchAllIndices(c, ['.{51}'])
FROM t;

SELECT multiFuzzyMatchAny('Hallo Welt', 1, ['.{51}']);

SELECT multiFuzzyMatchAny(c, 1, ['.{51}'])
FROM t;

SELECT multiFuzzyMatchAnyIndex('Hallo Welt', 1, ['.{51}']);

SELECT multiFuzzyMatchAnyIndex(c, 1, ['.{51}'])
FROM t;

SELECT multiFuzzyMatchAllIndices('Hallo Welt', 1, ['.{51}']);

SELECT multiFuzzyMatchAllIndices(c, 1, ['.{51}'])
FROM t;