SELECT * FROM outer_view_hardcoded_ok;
SELECT * FROM outer_view_parameterized_ko(a=1, b=2);
