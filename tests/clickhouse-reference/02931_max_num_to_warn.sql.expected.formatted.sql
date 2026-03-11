SELECT
    replaceRegexpAll(message, '\\(\\d+\\)', '_'),
    message_format_string
FROM `system`.warnings
WHERE like(message, 'The number of%')
ORDER BY message ASC;