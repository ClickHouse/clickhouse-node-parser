SELECT base64Encode();

SELECT base64Decode();

SELECT tryBase64Decode();

SELECT base64Encode('foo', 'excess argument');

SELECT base64Decode('foo', 'excess argument');

SELECT tryBase64Decode('foo', 'excess argument');

SELECT base64Encode(val)
FROM (
        SELECT arrayJoin(['', 'f', 'fo', 'foo', 'foob', 'fooba', 'foobar']) AS val
    );

SELECT base64Decode(val)
FROM (
        SELECT arrayJoin(['', 'Zg==', 'Zm8=', 'Zm9v', 'Zm9vYg==', 'Zm9vYmE=', 'Zm9vYmFy']) AS val
    );

SELECT tryBase64Decode(val)
FROM (
        SELECT arrayJoin(['', 'Zg==', 'Zm8=', 'Zm9v', 'Zm9vYg==', 'Zm9vYmE=', 'Zm9vYmFy']) AS val
    );

SELECT
    base64Decode(base64Encode('foo')) = 'foo',
    base64Encode(base64Decode('Zm9v')) == 'Zm9v';

SELECT
    tryBase64Decode(base64Encode('foo')) = 'foo',
    base64Encode(tryBase64Decode('Zm9v')) == 'Zm9v';

SELECT base64Decode('Zm9vYmF=Zm9v');

SELECT tryBase64Decode('Zm9vYmF=Zm9v');

SELECT base64Decode('foo');

SELECT tryBase64Decode('foo');

SELECT base64Decode('aoeo054640eu=');

SELECT tryBase64Decode('aoeo054640eu=');

SELECT base64Encode(toFixedString('foo', 3));

SELECT base64Decode(toFixedString('Zm9v', 4));

SELECT tryBase64Decode(toFixedString('Zm9v', 4));