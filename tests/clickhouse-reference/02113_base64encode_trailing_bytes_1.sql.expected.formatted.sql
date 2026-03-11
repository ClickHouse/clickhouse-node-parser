SELECT
    number,
    hex(base64Decode(base64Encode(repeat('a', number)))) AS r
FROM numbers(100);