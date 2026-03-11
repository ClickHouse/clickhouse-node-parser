

SELECT nested(['click', 'house'], x.b.first, x.b.second) AS n, toTypeName(n) FROM tab;
SELECT nested([['click', 'house']], x.b.first, x.b.second) AS n, toTypeName(n) FROM tab;
SELECT nested([['click'], ['house']], x.b.first, x.b.second) AS n, toTypeName(n) FROM tab; -- {serverError BAD_ARGUMENTS}
select x from tab;
select y, y.b.first, y.b.second from tab array join x as y; -- { serverError UNKNOWN_IDENTIFIER }
