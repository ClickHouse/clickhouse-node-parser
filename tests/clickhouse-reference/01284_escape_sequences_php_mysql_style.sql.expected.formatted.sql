SELECT
    'a\\_\\c\\l\\i\\c\\k\\h\\o\\u\\s',
    'a\\_\\c\\l\\i\\c\\k\\h\\o\\u\\s\\e';

SELECT
    like('aXb', 'a_b'),
    like('aXb', 'a\\_b'),
    like('a_b', 'a\\_b'),
    like('a_b', 'a\\_b');

SELECT
    match('Hello', '\\w+'),
    match('Hello', '\\w+'),
    match('Hello', '\\\\w+'),
    match('Hello', '\\w\\+'),
    match('Hello', 'w+');

SELECT match('Hello', '\\He\\l\\l\\o');

SELECT match('Hello', '\\H\\l\\l\\o');