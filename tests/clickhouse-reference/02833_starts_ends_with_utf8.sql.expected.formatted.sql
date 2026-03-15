-- { echoOn }
SELECT startsWithUTF8('富强民主文明和谐', '富强');

SELECT startsWithUTF8('富强民主文明和谐', '�');

SELECT startsWithUTF8('富强民主文明和谐', '');

SELECT startsWithUTF8('123', '123');

SELECT startsWithUTF8('123', '12');

SELECT startsWithUTF8('123', '1234');

SELECT startsWithUTF8('123', '');

SELECT endsWithUTF8('富强民主文明和谐', '和谐');

SELECT endsWithUTF8('富强民主文明和谐', '�');

SELECT endsWithUTF8('富强民主文明和谐', '');

SELECT endsWithUTF8('123', '3');

SELECT endsWithUTF8('123', '23');

SELECT endsWithUTF8('123', '32');

SELECT endsWithUTF8('123', '');