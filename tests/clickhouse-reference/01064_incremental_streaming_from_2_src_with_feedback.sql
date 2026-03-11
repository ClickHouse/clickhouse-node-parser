select '-- unmerged state';
select
   id,
   finalizeAggregation(latest_login_time) as current_latest_login_time,
   finalizeAggregation(latest_checkout_time) as current_latest_checkout_time,
   finalizeAggregation(fastest_session)  as current_fastest_session,
   finalizeAggregation(biggest_inactivity_period)  as current_biggest_inactivity_period
from target_table
where id in (1,2)
ORDER BY id, current_latest_login_time, current_latest_checkout_time;
SELECT
     id,
     maxMerge(latest_login_time) as current_latest_login_time,
     maxMerge(latest_checkout_time) as current_latest_checkout_time,
     minMerge(fastest_session) as current_fastest_session,
     maxMerge(biggest_inactivity_period) as current_biggest_inactivity_period
FROM target_table
where id in (1,2)
GROUP BY id
ORDER BY id;
