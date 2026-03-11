SELECT '-- unmerged state';

SELECT
    id,
    finalizeAggregation(latest_login_time) AS current_latest_login_time,
    finalizeAggregation(latest_checkout_time) AS current_latest_checkout_time,
    finalizeAggregation(fastest_session) AS current_fastest_session,
    finalizeAggregation(biggest_inactivity_period) AS current_biggest_inactivity_period
FROM target_table
WHERE id IN (1, 2)
ORDER BY
    id ASC,
    current_latest_login_time ASC,
    current_latest_checkout_time ASC;

SELECT
    id,
    maxMerge(latest_login_time) AS current_latest_login_time,
    maxMerge(latest_checkout_time) AS current_latest_checkout_time,
    minMerge(fastest_session) AS current_fastest_session,
    maxMerge(biggest_inactivity_period) AS current_biggest_inactivity_period
FROM target_table
WHERE id IN (1, 2)
GROUP BY id
ORDER BY id ASC;