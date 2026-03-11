SELECT id
FROM date_pv(dtparam = today());

SELECT id
FROM date_pv(dtparam = yesterday());

SELECT id
FROM date_pv(dtparam = yesterday() + 1);

SELECT id
FROM date_pv(dtparam = '1974-04-07');

SELECT id
FROM date_pv(dtparam = toDate('1974-04-07'));

SELECT id
FROM date_pv(dtparam = toString(toDate('1974-04-07')));

SELECT id
FROM date_pv(dtparam = toDate('1975-04-07'));

SELECT id
FROM date_pv(dtparam = (
        SELECT dt
        FROM date_table_pv
        WHERE id = 2
    ));

SELECT id
FROM date32_pv(dtparam = today());

SELECT id
FROM date32_pv(dtparam = yesterday());

SELECT id
FROM date32_pv(dtparam = yesterday() + 1);

SELECT id
FROM date32_pv(dtparam = '2199-12-31');

SELECT id
FROM date32_pv(dtparam = toDate32('1900-01-01'));

SELECT id
FROM date32_pv(dtparam = (
        SELECT dt
        FROM date32_table_pv
        WHERE id = 3
    ));

SELECT id
FROM date32_pv(dtparam = (
        SELECT dt
        FROM date32_table_pv
        WHERE id = 4
    ));

SELECT id
FROM uuid_pv(uuidparam = serverUUID());

SELECT id
FROM uuid_pv(uuidparam = toUUID('11111111-2222-3333-4444-555555555555'));

SELECT id
FROM uuid_pv(uuidparam = '11111111-2222-3333-4444-555555555555');

SELECT id
FROM uuid_pv(uuidparam = (
        SELECT uu
        FROM uuid_table_pv
        WHERE id = 1
    ));

SELECT id
FROM uuid_pv(uuidparam = (
        SELECT uu
        FROM uuid_table_pv
        WHERE id = 2
    ));

SELECT id
FROM uuid_pv(uuidparam = generateUUIDv4());

SELECT id
FROM uuid_pv(uuidparam = (
        SELECT generateUUIDv4()
    ));

SELECT id
FROM date_pv2(dtparam = today(), intparam = 1);

SELECT id
FROM date_pv2(dtparam = today(), intparam = length('A'));

SELECT id
FROM date_pv2(dtparam = '1974-04-07', intparam = length('AAA'));

SELECT id
FROM date_pv2(dtparam = toDate('1974-04-07'), intparam = length('BBB'));

SELECT id
FROM ipv4_pv(ipv4param = '116.106.34.242');

SELECT id
FROM ipv4_pv(ipv4param = toIPv4('116.106.34.243'));

SELECT id
FROM ipv4_pv(ipv4param = (
        SELECT ipaddr
        FROM ipv4_table_pv
        WHERE id = 3
    ));