SELECT multiIf((((multiIf(ID = ''
    AND ((ID = 'a'
    OR ID = 'c'
    OR ID = 'b')), 'a', 'x') AS y)) = 'c')
    OR (multiIf(ID = ''
    AND ((ID = 'a'
    OR ID = 'c'
    OR ID = 'b')), 'a', 'x') = 'b')
    OR (multiIf(ID = ''
    AND ((ID = 'a'
    OR ID = 'c'
    OR ID = 'b')), 'a', 'x') = 'd')
    OR (multiIf(ID = ''
    AND ((ID = 'a'
    OR ID = 'c'
    OR ID = 'b')), 'a', 'x') = 'e'), 'test', 'x') AS alias
FROM remote('127.0.0.{1,2}', currentDatabase(), t)
GROUP BY alias;