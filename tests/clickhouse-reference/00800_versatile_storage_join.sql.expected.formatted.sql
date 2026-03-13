-- read from StorageJoin
SELECT '--------read--------';

SELECT *
FROM join_any_inner
ORDER BY k ASC;

SELECT *
FROM join_any_left
ORDER BY k ASC;

SELECT *
FROM join_all_inner
ORDER BY k ASC;

SELECT *
FROM join_all_left
ORDER BY k ASC;

SELECT joinGet('join_any_left', 's', number)
FROM numbers(3);

SELECT joinGet('join_any_left_null', 's', number)
FROM numbers(3);

-- Using identifier as the first argument
SELECT joinGet(join_any_left, 's', number)
FROM numbers(3);

SELECT joinGet(join_any_left_null, 's', number)
FROM numbers(3);

SELECT
    joinGet('join_string_key', 'x', 'abc'),
    joinGet('join_string_key', 'k', 'abc');

SELECT joinGet('join_test', 'b', 1);

SELECT joinGet(concat({CLICKHOUSE_DATABASE:String}, '.join_test'), 'b', 1);