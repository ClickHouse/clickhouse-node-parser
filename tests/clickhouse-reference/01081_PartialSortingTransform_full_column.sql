select 1 from remote('127.{1,2}', currentDatabase(), test_01081) lhs join system.one as rhs on rhs.dummy = 1 order by 1
SETTINGS enable_analyzer = 0; -- { serverError INVALID_JOIN_ON_EXPRESSION }
select 1 from remote('127.{1,2}', currentDatabase(), test_01081) lhs join system.one as rhs on rhs.dummy = 1 order by 1
SETTINGS enable_analyzer = 1;
