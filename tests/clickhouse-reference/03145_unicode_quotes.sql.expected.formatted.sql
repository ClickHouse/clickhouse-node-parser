SELECT 'This is an example of using English-style Unicode single quotes.' AS curly;

SELECT 'This is \\an \\\\example ‘of using English-style Unicode single quotes.\\' AS `\\c\\\\u\\\\\\r\\\\\\\\l\\\\\\\\\\y\\\\\\\\\\\\`
FORMAT Vertical;

SELECT '' = '' AS `1`
FORMAT JSONLines;