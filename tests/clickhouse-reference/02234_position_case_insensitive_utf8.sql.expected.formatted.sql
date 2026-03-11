SELECT positionCaseInsensitiveUTF8('Hello', materialize('%�%'));

SELECT DISTINCT positionCaseInsensitiveUTF8(materialize('Hello'), '%�%')
FROM numbers(1000);