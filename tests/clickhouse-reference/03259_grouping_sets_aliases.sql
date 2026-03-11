SELECT user_level as level_alias, uniq(name) as name_alias, grouping(level_alias) as _totals
FROM remote('127.0.0.{1,2}', currentDatabase(), users)
GROUP BY GROUPING SETS ((level_alias))
ORDER BY name_alias DESC;
