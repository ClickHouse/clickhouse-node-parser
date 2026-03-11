SELECT base64URLEncode();

SELECT base64URLDecode();

SELECT tryBase64URLDecode();

SELECT base64URLEncode('foo', 'excess argument');

SELECT base64URLDecode('foo', 'excess argument');

SELECT tryBase64URLDecode('foo', 'excess argument');

SELECT
    'https://clickhouse.com' AS original,
    base64URLEncode(original) AS encoded,
    base64URLDecode(encoded),
    tryBase64URLDecode(encoded);

SELECT
    '12?' AS original,
    base64URLEncode(original) AS encoded,
    base64URLDecode(encoded),
    tryBase64URLDecode(encoded);

SELECT
    'https://www.google.com/search?q=clickhouse+base64+decode&sca_esv=739f8bb380e4c7ed&ei=TfRiZqCDIrmnwPAP2KLRkA8&ved=0ahUKEwjg3ZHitsmGAxW5ExAIHVhRFPIQ4dUDCBA&uact=5&oq=clickhouse+base64+decode' AS original,
    base64URLEncode(original) AS encoded,
    base64URLDecode(encoded),
    tryBase64URLDecode(encoded);

SELECT
    'aHR0cHM6Ly9jbGlj' AS encoded,
    base64URLDecode(encoded),
    tryBase64URLDecode(encoded);

SELECT
    'aHR0cHM6Ly9jbGlja2g' AS encoded,
    base64URLDecode(encoded),
    tryBase64URLDecode(encoded);

SELECT
    'aHR0cHM6Ly9jbGljaw' AS encoded,
    base64URLDecode(encoded),
    tryBase64URLDecode(encoded);

SELECT base64URLDecode('https://clickhouse.com');

SELECT tryBase64URLDecode('https://clickhouse.com');

SELECT base64URLDecode('12?');

SELECT tryBase64URLDecode('12?');

SELECT base64URLDecode('aHR0cHM6Ly9jbGlja');

SELECT tryBase64URLDecode('aHR0cHM6Ly9jbGlja');

SELECT
    toFixedString('https://clickhouse.com', 22) AS original,
    base64URLEncode(original) AS encoded,
    base64URLDecode(encoded),
    tryBase64URLDecode(encoded);