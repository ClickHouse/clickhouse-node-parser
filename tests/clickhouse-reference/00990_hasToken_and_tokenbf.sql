SELECT max(id) FROM bloom_filter WHERE hasToken(s, 'abc,def,zzz'); -- { serverError BAD_ARGUMENTS }
SELECT max(id) FROM bloom_filter WHERE hasTokenCaseInsensitive(s, 'abc,def,zzz'); -- { serverError BAD_ARGUMENTS }
SELECT max(id) FROM bloom_filter WHERE hasTokenOrNull(s, 'abc,def,zzz');
SELECT max(id) FROM bloom_filter WHERE hasTokenCaseInsensitiveOrNull(s, 'abc,def,zzz');
SELECT max(id) FROM bloom_filter WHERE hasToken(s, 'abc');
SELECT max(id) FROM bloom_filter WHERE hasTokenOrNull(s, 'abc');
select max(id) from bloom_filter where hasTokenCaseInsensitive(s, 'ABC');
select max(id) from bloom_filter where hasTokenCaseInsensitiveOrNull(s, 'ABC');
SELECT max(id) FROM bloom_filter WHERE hasToken(s, 'def');
SELECT max(id) FROM bloom_filter WHERE hasToken(s, 'zzz');
select max(id) from bloom_filter where hasTokenCaseInsensitive(s, 'zZz');
select max(id) from bloom_filter2 where hasToken(s, 'ABC');
select max(id) from bloom_filter2 where hasTokenCaseInsensitive(s, 'abc');
-- invert result
-- this does not work as expected, reading more rows that it should
-- SELECT max(id) FROM bloom_filter WHERE NOT hasToken(s, 'yyy');

-- accessing to many rows
SELECT max(id) FROM bloom_filter WHERE hasToken(s, 'yyy'); -- { serverError TOO_MANY_ROWS }
-- this syntax is not supported by tokenbf
SELECT max(id) FROM bloom_filter WHERE hasToken(s, 'zzz') == 1; -- { serverError TOO_MANY_ROWS }
SELECT * FROM tab WHERE str == 'else' AND 1.0;
