SELECT * FROM 02702_logical_optimizer WHERE a = 1 OR 3 = a OR NULL = a;
SELECT * FROM 02702_logical_optimizer WHERE a = 1 OR 3 = a OR 2 = a OR a = NULL;
SELECT * FROM 02702_logical_optimizer_with_null_column WHERE a = 1 OR 3 = a OR 2 = a;
SELECT materialize(1) AS k WHERE NULL OR (0 OR (k = 2) OR (k = CAST(1, 'Nullable(UInt8)') OR k = 3));
SELECT (k = 2) OR (k = 1) OR ((NULL OR 1) = k) FROM (SELECT 1 AS k);
