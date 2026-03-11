select a, b, x, y from (select a, b, 1 as x, 2 as y from t_rio order by a) order by a, b format Null;
