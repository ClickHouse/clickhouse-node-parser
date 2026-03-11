SELECT *
FROM system.completions
WHERE startsWith(word, '0003566')
ORDER BY word
LIMIT 5
FORMAT PrettyCompact;
