select count(), * from dist_01247 group by number order by number limit 1 settings prefer_localhost_replica=1;
-- Now, sharding key optimization is not supported for distributed over distributed with serialized plan.
select count(), * from dist_01247 group by number order by number limit 1 settings prefer_localhost_replica=0, serialize_query_plan=1, enable_analyzer=1;
select count(), * from dist_01247 group by number order by number limit 1;
