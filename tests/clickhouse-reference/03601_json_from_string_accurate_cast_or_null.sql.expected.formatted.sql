SELECT accurateCastOrNull('{"a" : 42, "a" : 43}', 'JSON');

SELECT accurateCastOrNull(materialize('{"a" : 42, "a" : 43}'), 'JSON');

SELECT accurateCastOrDefault('{"a" : 42, "a" : 43}', 'JSON');

SELECT accurateCastOrDefault(materialize('{"a" : 42, "a" : 43}'), 'JSON');