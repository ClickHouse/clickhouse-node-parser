create table t_00725_4(a Int64, b Int64, c String) engine = TinyLog;
create table s_00725_4(a Int64, b Int64, c String) engine = TinyLog;
select t_00725_4.* from t_00725_4 all left join s_00725_4 on (s_00725_4.a = t_00725_4.a and s_00725_4.b = t_00725_4.b) where s_00725_4.a = 0 and s_00725_4.b = 0;
