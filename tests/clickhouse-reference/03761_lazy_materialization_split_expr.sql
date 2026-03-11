select trimLeft(explain) from (explain actions=1 select * from (select sin(x) + y as a, sin(x) - z as b from tab) order by b limit 10
settings query_plan_max_limit_for_lazy_materialization=0, query_plan_execute_functions_after_sorting=0) where explain like '%Lazily read columns%';
