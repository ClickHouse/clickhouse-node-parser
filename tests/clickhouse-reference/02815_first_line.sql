select firstLine('foo\nbar\nbaz');
select firstLine('foo\rbar\rbaz');
select firstLine('foo\r\nbar\r\nbaz');
select firstLine('foobarbaz');
select n, firstLine(text) from 02815_first_line_vector order by n;
