SELECT COUNT()
FROM indexed_table
WHERE like(log_message, '%x%');

SELECT COUNT()
FROM another_indexed_table
WHERE like(log_message, '%x%');