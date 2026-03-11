SELECT firstLine('foo\nbar\nbaz');

SELECT firstLine('foo\rbar\rbaz');

SELECT firstLine('foo\r\nbar\r\nbaz');

SELECT firstLine('foobarbaz');

SELECT
    n,
    firstLine(text)
FROM `02815_first_line_vector`
ORDER BY n ASC;