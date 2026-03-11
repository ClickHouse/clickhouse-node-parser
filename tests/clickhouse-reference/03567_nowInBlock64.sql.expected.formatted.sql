SELECT nowInBlock64(3, 'America/Sao_Paulo', 3);

SELECT nowInBlock64(10);

SELECT nowInBlock64('string');

SELECT nowInBlock64(3, true);

SELECT nowInBlock64(3, 3);

SELECT nowInBlock64(3, 'string');

SELECT count()
FROM (
        SELECT DISTINCT
            nowInBlock64(),
            nowInBlock64(3),
            nowInBlock64(3, 'Pacific/Pitcairn')
        FROM `system`.numbers
        LIMIT 3
    );

SELECT isNull(nowInBlock64(NULL));

SELECT nowInBlock64(materialize(toUInt128(3)), 'America/Sao_Paulo')
FORMAT Null;