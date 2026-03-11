SELECT '-------- Bloom filter --------';
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_bf WHERE startsWith(message, 'Serv')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_bf WHERE startsWith(message, 'Serv');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_bf WHERE startsWith(message, 'Serv i')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_bf WHERE startsWith(message, 'Serv i');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_bf WHERE endsWith(message, 'eady')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_bf WHERE endsWith(message, 'eady');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_bf WHERE endsWith(message, ' eady')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_bf WHERE endsWith(message, ' eady');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_bf WHERE match(message, 'no')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_bf WHERE match(message, 'no');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_bf WHERE match(message, ' xyz ')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_bf WHERE match(message, ' xyz ');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_bf WHERE multiSearchAny(message, ['ce', 'no'])
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_bf WHERE multiSearchAny(message, ['ce', 'no']);
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_bf WHERE multiSearchAny(message, [' wx ', ' yz '])
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_bf WHERE multiSearchAny(message, [' wx ', ' yz ']);
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_bf WHERE multiSearchAny(message, [' wx ', 'yz'])
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_bf WHERE multiSearchAny(message, [' wx ', 'yz']);
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE startsWith(message, 'Serv')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE startsWith(message, 'Serv');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE startsWith(message, 'Serv i')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE startsWith(message, 'Serv i');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE endsWith(message, 'eady')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE endsWith(message, 'eady');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE endsWith(message, ' eady')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE endsWith(message, ' eady');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE match(message, 'no')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE match(message, 'no');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE match(message, ' xyz ')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE match(message, ' xyz ');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE like(message, '%rvice is definitely rea%')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE like(message, '%rvice is definitely rea%');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE like(message, '%rvi%')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE like(message, '%rvi%');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE like(message, '%foo%')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE like(message, '%foo%');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE notLike(message, '%rvice is rea%')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE notLike(message, '%rvice is rea%');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE notLike(message, '%rvice is not rea%')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE notLike(message, '%rvice is not rea%');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE notLike(message, '%ready%')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE notLike(message, '%ready%');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE equals(message, 'Service is not ready')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE equals(message, 'Service is not ready');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE equals(message, 'Service is not rea')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE equals(message, 'Service is not rea');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE notEquals(message, 'Service is not rea')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE notEquals(message, 'Service is not rea');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE notEquals(message, 'Service is not ready')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE notEquals(message, 'Service is not ready');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE hasTokenOrNull(message, 'ready')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE hasTokenOrNull(message, 'ready');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE hasTokenOrNull(message, 'foo')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE hasTokenOrNull(message, 'foo');
SELECT trim(explain)
FROM (
    EXPLAIN indexes = 1 SELECT * FROM 03165_token_ft WHERE hasTokenOrNull(message, 'rea dy')
)
WHERE explain LIKE '%Parts:%';
SELECT * FROM 03165_token_ft WHERE hasTokenOrNull(message, 'rea dy');
