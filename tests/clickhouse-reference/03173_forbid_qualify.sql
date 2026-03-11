select count() from test_qualify; -- 100
select * from test_qualify qualify row_number() over (order by number) = 50 SETTINGS enable_analyzer = 1; -- 49
select * from test_qualify qualify row_number() over (order by number) = 50 SETTINGS enable_analyzer = 0; -- { serverError NOT_IMPLEMENTED }
