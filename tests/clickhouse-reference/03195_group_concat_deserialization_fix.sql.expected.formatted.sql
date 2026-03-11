SELECT groupConcatMerge(text) AS concatenated_text
FROM test_serialization
GROUP BY id;

SELECT groupConcatMerge(text) AS concatenated_text
FROM test_serialization
GROUP BY id
ORDER BY id ASC;