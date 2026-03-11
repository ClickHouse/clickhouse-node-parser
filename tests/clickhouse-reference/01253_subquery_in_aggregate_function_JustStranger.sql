SELECT
  text,
  uniqExactIf(hash, hash IN (
    SELECT DISTINCT
      hash
    FROM test_table AS t1
  )) as counter
FROM test_table AS t2
GROUP BY text
ORDER BY counter, text;
