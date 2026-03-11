SELECT bech32Encode('bc', unhex('751e76e8199196d454941c45d1b3a323f1433bd6'));

SELECT bech32Encode('tb', unhex('751e76e8199196d454941c45d1b3a323f1433bd6'));

SELECT bech32Encode('bc', unhex('751e76e8199196d454941c45d1b3a323f1433bd6751e76e8199196d454941c45d1b3a323f1433bd6751e76e8199196d45494'));

SELECT bech32Encode('bcrt', unhex(''));

SELECT bech32Encode('bcrt', unhex('751e76e8199196d454941c45d1b3a323f1433bd6'));

SELECT bech32Encode('tltc', unhex('751e76e8199196d454941c45d1b3a323f1433bd6'));

SELECT bech32Encode('tltssdfsdvjnasdfnjkbhksdfasnbdfkljhaksdjfnakjsdhasdfnasdkfasdfasdfasdf', unhex('751e'));

SELECT bech32Encode('tltssdfsdvjnasdfnjkbhksdfasnbdfkljhaksdjfnakjsdhasdfnasdkfasdfasdfasdfdljsdfasdfahc', unhex('751e76e8199196d454941c45d1b3a323f1433bd6'));

SELECT bech32Encode('', unhex('751e76e8199196d454941c45d1b3a323f1433bd6'));

SELECT bech32Encode('', unhex('751e76e8199196d454941c45d1b3a323f1433bd6751e76e8199196d454941c45d1b3a323f1433bd6751e76e8199196d45494a'));

SELECT bech32Encode('bc', unhex('751e76e8199196d454941c45d1b3a323f1433bd6'), 1) == bech32Encode('bc', unhex('751e76e8199196d454941c45d1b3a323f1433bd6'));

SELECT bech32Encode('bc', unhex('751e76e8199196d454941c45d1b3a323f1433bd6'), 0);

SELECT substring(s1, 5, -6) == substring(s2, 5, -6)
FROM (
        SELECT
            bech32Encode('bc', unhex('751e76e8199196d454941c45d1b3a323f1433bd6'), 1) AS s1,
            bech32Encode('bc', unhex('751e76e8199196d454941c45d1b3a323f1433bd6'), 10) AS s2
    );

SELECT
    tup.1 AS hrp,
    hex(tup.2) AS data
FROM (
        SELECT bech32Decode(bech32Encode('bc', unhex('751e76e8199196d454941c45d1b3a323f1433bd6'))) AS tup
    );

SELECT bech32Encode('bc', unhex(data))
FROM hex_data
LIMIT 1;

SELECT bech32Encode(hrp, unhex('6687112a6eadb4d88d29c7a45da56eff0c23b0e14e757d408e'))
FROM hex_data
LIMIT 1;

SELECT bech32Encode(hrp, unhex(data), 1)
FROM hex_data
LIMIT 1;

SELECT
    bech32Encode(hrp, unhex(data)) AS enc,
    bech32Encode(hrp, unhex(data), witver) AS enc_witver,
    bech32Encode(hrp, unhex(data), witver) = bech32Encode(hrp_fixed, unhex(data_fixed), witver) AS match1,
    bech32Encode(hrp, unhex(data), witver) = bech32Encode(hrp, unhex(data_fixed), witver) AS match2,
    bech32Encode(hrp, unhex(data), witver) = bech32Encode(hrp_fixed, unhex(data), witver) AS match3
FROM bech32_test;

SELECT
    tup.1,
    hex(tup.2)
FROM (
        SELECT bech32Decode('bc1qar0srrr7xfkvy5l643lydnw9re59gtzzwf5mdq') AS tup
    );

SELECT
    hrp,
    data,
    hrp = tup.1 AS match_hrp,
    data = lower(hex(tup.2)) AS match_data
FROM (
        SELECT
            hrp,
            data,
            bech32Decode(bech32Encode(hrp, unhex(data), witver)) AS tup
        FROM bech32_test
    ) AS round_trip;

SELECT bech32Decode('');

SELECT bech32Decode('foo');

SELECT
    tup.1 AS hrp,
    hex(tup.2) AS data
FROM (
        SELECT bech32Decode('bc1pw508d6qejxtdg4y5r3zarvary0c5xw7kj9wkru') AS tup
    );

SELECT
    tup.1 AS hrp,
    hex(tup.2) AS data
FROM (
        SELECT bech32Decode('tb1pw508d6qejxtdg4y5r3zarvary0c5xw7kcr49c0') AS tup
    );

SELECT
    t1.1 != '',
    t1.1 == t2.1,
    t1.2 == t2.2
FROM (
        SELECT
            bech32Decode('bc1qw508d6qejxtdg4y5r3zarvary0c5xw7kv8f3t4') AS t1,
            bech32Decode('bc1pw508d6qejxtdg4y5r3zarvary0c5xw7kj9wkru') AS t2
    );

SELECT
    t1.1 != '',
    t1.1 == t2.1,
    t1.2 == t2.2
FROM (
        SELECT
            bech32Decode('tb1qw508d6qejxtdg4y5r3zarvary0c5xw7kxpjzsx') AS t1,
            bech32Decode('tb1pw508d6qejxtdg4y5r3zarvary0c5xw7kcr49c0') AS t2
    );

SELECT
    tup.1 AS hrp,
    hex(tup.2) AS data
FROM (
        SELECT bech32Decode('b1pw508d6qejxtdg4y5r3zarvary0c5xw7kw508d6qejxtdg4y5r3zarvary0c5xw7kw508d6qejxtdg4y565gdg8') AS tup
    );

SELECT
    tup.1 AS hrp,
    hex(tup.2) AS data
FROM (
        SELECT bech32Decode('b1w508dfqejxtdg4y5r3zarvary0c5xw7kw508d6qejxtdg4y5r3zarvary0c5xw7kw508d6qejxtdg4y5xgqsaanm') AS tup
    );

SELECT
    address,
    bech32Decode(address).1 AS hrp,
    hex(bech32Decode(address).2) AS decoded,
    hex(bech32Decode(address_fixed).2) AS decoded_fixed,
    hex(bech32Decode(address).2) = hex(bech32Decode(address_fixed).2) AS match
FROM bech32_test;