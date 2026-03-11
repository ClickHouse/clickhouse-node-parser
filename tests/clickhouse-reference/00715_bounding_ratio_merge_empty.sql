SELECT boundingRatioMerge(state) FROM (
  select boundingRatioState(timestamp, event) as state from rate_test
  UNION ALL
  SELECT boundingRatioState(timestamp, event) FROM rate_test2 WHERE 1=0
);
