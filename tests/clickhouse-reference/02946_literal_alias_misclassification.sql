SELECT 'const' AS r, b 
FROM
  ( SELECT a AS r, b FROM literal_alias_misclassification ) AS t1
  LEFT JOIN
  ( SELECT a AS r FROM literal_alias_misclassification ) AS t2 
  ON t1.r = t2.r
ORDER BY b;
