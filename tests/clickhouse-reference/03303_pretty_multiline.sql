SELECT * FROM VALUES(('Hello', 'World'), ('Hel\nlo', 'World'), ('Hello\n', 'World'), ('\nHello\n\n', 'Wor  \n ld')) FORMAT Pretty;
SELECT * FROM VALUES(('Hello', 'World'), ('Hel\nlo', 'World'), ('Hello\n', 'World'), ('\nHello\n\n', 'Wor  \n ld')) FORMAT PrettyCompact;
SELECT * FROM VALUES(('Hello', 'World'), ('Hel\nlo', 'World'), ('Hello\n', 'World'), ('\nHello\n\n', 'Wor  \n ld')) FORMAT PrettySpace;
