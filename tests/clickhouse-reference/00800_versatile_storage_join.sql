-- read from StorageJoin

SELECT '--------read--------';
SELECT * from join_any_inner ORDER BY k;
SELECT * from join_any_left ORDER BY k;
SELECT * from join_all_inner ORDER BY k;
SELECT * from join_all_left ORDER BY k;
SELECT joinGet('join_any_left', 's', number) FROM numbers(3);
SELECT joinGet('join_any_left_null', 's', number) FROM numbers(3);
-- Using identifier as the first argument

SELECT joinGet(join_any_left, 's', number) FROM numbers(3);
SELECT joinGet(join_any_left_null, 's', number) FROM numbers(3);
SELECT joinGet('join_string_key', 'x', 'abc'), joinGet('join_string_key', 'k', 'abc');
select joinGet('join_test', 'b', 1);
SELECT joinGet({CLICKHOUSE_DATABASE:String} || '.join_test', 'b', 1);
