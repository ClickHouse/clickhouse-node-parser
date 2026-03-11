SELECT number, arr FROM (SELECT number, arrayFilter(x -> x = 0, [1]) AS arr FROM system.numbers LIMIT 10) ARRAY JOIN arr ORDER BY number;
