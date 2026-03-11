SELECT
    user_level AS level_alias,
    uniq(name) AS name_alias,
    grouping(level_alias) AS _totals
FROM remote('127.0.0.{1,2}', currentDatabase(), users)
GROUP BY GROUPING SETS ((level_alias))
ORDER BY name_alias DESC;