SELECT table, name, comment
FROM system.columns
WHERE table = 'check_query_comment_column' AND database = currentDatabase()
FORMAT PrettyCompactNoEscapes;
