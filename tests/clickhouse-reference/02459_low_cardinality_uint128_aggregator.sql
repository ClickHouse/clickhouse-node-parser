SELECT k, sum(v) AS s FROM group_by_pk_lc_uint128 GROUP BY k ORDER BY k ASC LIMIT 1024 SETTINGS optimize_aggregation_in_order = 1;
SELECT k, sum(v) AS s FROM group_by_pk_lc_uint256 GROUP BY k ORDER BY k ASC LIMIT 1024 SETTINGS optimize_aggregation_in_order = 1;
